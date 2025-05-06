import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Features/App/WorkshopDashboard/Main/Pages/main_dashbored_screen.dart';
import 'Features/App/WorkshopDashboard/Pages/Calender/Cubit/cubit/calender_orders_dash_board_cubit.dart';
import 'Config/build_root_starting.dart';
import 'Features/App/Service/Recommendation/presentation/pages/recommendation_screen.dart';
import 'Features/App/Service/AreaMeasurement/Pages/area_measurement_screen.dart';
import 'Features/App/Service/Recommendation/presentation/Cubit/recommendation_cubit.dart';
import 'Config/Cubit/settings_cubit.dart';
import 'Config/Routes/Navigation/navigation_service.dart';
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


//*(Orders Carpenter and Orders Cart ) => one day
//  Orders Cart in page show pending orders and success orders in column when press for any one show view as cart and in ui pending orders show where the order stuats now
//  Order  Carpenter in page show pending orders and success orders in column when press for any one show view as cart and in ui pending orders show where the order stuats now

//*( ui Tools and ui Truck ) => two day or three
//  Orders ui Tools in page show all tools is rent or sall or both and setup same order ui carpenter
//! Orders ui trucks in page





// TODO: one day => (Orders Carpenter and Orders Cart )  
// TODO: last day => ( ui Tools and ui Truck )

//? try edit measurement camera ar 





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
        BlocProvider(create: (_) => MainCubit(), child: MainAppScreen()),
        BlocProvider(
            create: (_) =>
                SearchCubit(SearchUseCase(SearchRepoImpl()))..getAllProducts(),
            child: MainAppScreen()),
        BlocProvider(create: (_) => sl<ExploreCubit>(), child: ExploreScreen()),
        BlocProvider(
            create: (_) => AreaMeasurementCubit(),
            child: AreaMeasurementScreen()),
        BlocProvider(
            create: (_) => RecommendationCubit()..getOptionsRoom(),
            child: RecommendationScreen()),
        BlocProvider(
            create: (_) => CalenderOrdersDashBoardCubit(),
            child: MainDashBoredScreen()),
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
          DioHelper.init();
          return BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return BuildRootStarting(
                state: state,
                navigatorKey: kNavigationService.navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
