import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Config/Cubit/settings_cubit.dart';
import '../../../App/common/Explore/presentation/Cubit/explore_cubit.dart';
import '../../../App/common/Home/presentation/manager/home_cubit.dart';
import '../../../App/User/presentation/Cubit/user_cubit.dart';
import '../../../../Core/Resources/app_list.dart';

import '../../../../../Config/Routes/route_name.dart';
import '../../../../Config/screen_orientation_helper.dart';
import '../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../main.dart';
import 'loading_splash.dart';
import 'background_painter.dart';
import 'build_main_details_splash.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {

  @override
  void initState() {
    super.initState();
    AppScreenOrientationHelper.lockPortrait();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: true,
        systemNavigationBarContrastEnforced: true,
      ));
    });
    context.read<SettingsCubit>().startAnimations();
    context.read<SettingsCubit>().endAnimations();
    context.read<HomeCubit>().init(context);
    context.read<UserCubit>().init(context);
    context.read<ExploreCubit>().init(context);
     _navigateToNextScreen();


  }


  Future<void> _navigateToNextScreen() async {
    final bool isOnboardingCompleted = await LocalStorageService.getValue(
      LocalStorageKeys.isOnboardingCompleted,
      defaultValue: false,
    );
    final bool isFirstTime = await LocalStorageService.getValue(
      LocalStorageKeys.isFirstTime,
      defaultValue: false,
    );
    
    final String  isToken = await LocalStorageService.getValue(
      LocalStorageKeys.token,
      defaultValue: "",
    );

    if (!isOnboardingCompleted) {
      await kNavigationService.clearAndNavigateTo(AppRoutes.boarding);
      return;
    }
    final String nextRoute = isFirstTime
        ? isToken.isNotEmpty
            ? AppRoutes.main
            : AppRoutes.authentication
        : AppRoutes.authentication;
    await Future.delayed(Duration(milliseconds: 2000));
    await kNavigationService.clearAndNavigateTo(nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    var read = context.read<SettingsCubit>().state ;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          ...AppList.gradientColorsBackground,
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
              size: Size.infinite,
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              top: 188.5.h,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: read.logoOpacity,
                child: LogoAndText(),
              )),
          Positioned(
            right: 0,
            left: 0,
            bottom: 148.h,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity:read.loadingOpacity,
              child: Loading(),
            ),
          ),
        ],
      ),
    );
  }
}
