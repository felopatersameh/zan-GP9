import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Config/Cubit/settings_cubit.dart';
import 'Config/Routes/Navigation/navigation_service.dart';
import 'Config/Routes/route_constants.dart';
import 'Config/Routes/route_generator.dart';
import 'Config/app_config.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final NavigationService navigationService = NavigationService();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          ScreenUtil.init(context);
          return BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return MaterialApp(
                title: AppConfig.appName,
                locale: state.locale,
                themeMode: state.themeMode,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: RouteNames.splash,
                navigatorKey: navigationService.navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
