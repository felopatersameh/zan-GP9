import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Config/Themes/light.dart';
import 'Config/Cubit/settings_cubit.dart';
import 'Config/Routes/Navigation/navigation_service.dart';
import 'Config/Routes/route_name.dart';
import 'Config/Routes/route_generator.dart';
import 'Config/Themes/dark_theme.dart';
import 'Config/app_config.dart';
import 'Core/Services/service_locator.dart';
import 'Core/Storage/Remote/api_service.dart';
import 'Features/client/App/Explore/presentation/Cubit/explore_cubit.dart';
import 'Features/client/App/Home/presentation/manager/home_cubit.dart';
import 'Features/client/common/User/presentation/Cubit/user_cubit.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final AppNavigationService kNavigationService = AppNavigationService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsCubit(), lazy: false),
        BlocProvider.value(value: sl<UserCubit>()..init()),
        BlocProvider.value(value: sl<ExploreCubit>()..init()),
        BlocProvider.value(value: sl< HomeCubit>()..init()),

      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        enableScaleWH: () => false,
        enableScaleText: () => true,
        builder: (_, child) {
          ScreenUtil.init(context);
          return BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              DioHelper.init();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppConfig.appName,
                locale: state.locale,
                themeMode: state.themeMode,
                theme: lightThemes(),
                darkTheme: darkThemes(),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: AppRoutes.splash,
                navigatorKey: kNavigationService.navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
