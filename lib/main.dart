import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Features/App/common/Search/presentation/pages/search_screen.dart';
import 'Features/App/Service/Recommendation/presentation/pages/recommendation_screen.dart';
import 'Features/App/Service/AreaMeasurement/Pages/area_measurement_screen.dart';
import 'Features/App/Service/Recommendation/presentation/Cubit/recommendation_cubit.dart';
import 'Config/Themes/light.dart';
import 'Config/Cubit/settings_cubit.dart';
import 'Config/Routes/Navigation/navigation_service.dart';
import 'Config/Routes/route_name.dart';
import 'Config/Routes/route_generator.dart';
import 'Config/Themes/dark_theme.dart';
import 'Config/app_config.dart';
import 'Core/Services/Payment/Strip/data/data_sources/api_keys.dart';
import 'Core/Services/ServiceLocator/service_locator.dart';
import 'Core/Storage/Remote/api_service.dart';
import 'Features/App/common/Explore/presentation/Cubit/explore_cubit.dart';
import 'Features/App/common/Explore/presentation/pages/explore_srceen.dart';
import 'Features/App/common/Home/presentation/manager/home_cubit.dart';
import 'Features/App/Service/AreaMeasurement/Cubit/area_measurement_cubit.dart';
import 'Features/App/User/presentation/Cubit/user_cubit.dart';
import 'Features/App/common/Main/Cubit/main_cubit.dart';
import 'Features/App/common/Main/pages/main_app_screen.dart';
import 'Features/App/common/Search/domain/repositories/search_repo_impl.dart';
import 'Features/App/common/Search/domain/useCases/search_use_case.dart';
import 'Features/App/common/Search/presentation/manager/search_cubit.dart';
import 'generated/l10n.dart';

final AppNavigationService kNavigationService = AppNavigationService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Stripe.publishableKey = ApiKeys.publishKey;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsCubit(), lazy: false),
        BlocProvider(create: (_) => sl<HomeCubit>()),
        BlocProvider(create: (_) => sl<UserCubit>()),
        BlocProvider(
          create: (_) => MainCubit(),
          child: MainAppScreen(),
        ),
        BlocProvider(
          create: (_) =>
              SearchCubit(SearchUseCase(SearchRepoImpl()))..getAllProducts(),
          child: SearchScreen(),
        ),
        BlocProvider(
          create: (_) => sl<ExploreCubit>(),
          child: ExploreScreen(),
        ),
        BlocProvider(
          create: (_) => AreaMeasurementCubit(),
          child: AreaMeasurementScreen(),
        ),
        BlocProvider(
          create: (_) => RecommendationCubit()..getOptionsRoom(),
          child: RecommendationScreen(),
        ),
        // BlocProvider(create: (_) => WorkshopDashboardCubit(),child: WorkshopDashboardScreen(),),
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
