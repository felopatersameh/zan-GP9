import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../main.dart';
import 'app_colors.dart';
import '../../generated/l10n.dart';
import '../Utils/Extensions/localizations_extension.dart';
import '../Utils/Enums/numbers_of_cross_axis_count.dart';
import '../Utils/Extensions/int_extension.dart';
import '../Utils/Widget/tutorial_helper.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';


class AppConstants {
  static const String imagePathProducts ="https://darkturquoise-eagle-921470.hostingersite.com/storage/products/" ;
  static const String imagePathUser ="https://darkturquoise-eagle-921470.hostingersite.com/storage/profile/" ;
  static DotsDecorator get dotsDecoration {
    return DotsDecorator(
      size: Size(8.w, 8.h),
      activeSize: Size(24.w, 8.h),
      color: AppColors.grayscale80,
      activeColor: AppColors.backgroundColor,
      spacing: EdgeInsets.symmetric(horizontal: 4.w),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0).r,
      ),
    );
  }

  static SliverGridDelegate gridDelegateSmallBuilder(
      NumbersOfCrossAxisCount numbersOfCrossAxisCount) {
    final count = numbersOfCrossAxisCount.value[0];
    final ratio = numbersOfCrossAxisCount.value[1];
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: (count.toInt()).crossAxisCountBuilder,
      mainAxisSpacing: 16.h,
      crossAxisSpacing: 21.w,
      childAspectRatio: ratio.toDouble(),
    );
  }

  static List<TutorialStep> tutorialFloatingStep({
    required S local,
    required GlobalKey carpenterService,
    required GlobalKey columnService,
    required GlobalKey truckService,
    required GlobalKey rentService,
    required GlobalKey chatService,
  }) {
    return [
      TutorialStep(
        identify: "Service",
        title: local.Service,
        text: local.ServiceDes,
        key: columnService,
        shape: ShapeLightFocus.RRect,
      ),
      TutorialStep(
        identify: "chat",
        title: local.SmartAssistantFeature,
        text: local.SmartAssistantFeatureDes,
        key: chatService,
        shape: ShapeLightFocus.RRect,
      ),
      TutorialStep(
        identify: "Carpenter",
        title: local.Carpenter,
        text: local.CarpenterDes,
        key: carpenterService,
        shape: ShapeLightFocus.RRect,
      ),
      TutorialStep(
        identify: "Trucks",
        title: local.Trucks,
        text: local.TrucksDes,
        key: truckService,
        shape: ShapeLightFocus.RRect,
      ),
      TutorialStep(
        identify: "Rent",
        title: local.Rent,
        text: local.RentDes,
        key: rentService,
        shape: ShapeLightFocus.RRect,
      ),
    ];
  }

  static List<TutorialStep> tutorialMainStep({
    required BuildContext context,
    required GlobalKey scanKey,
    required GlobalKey floatingKey,
  }) {
    final local = context.local;

    return [
      TutorialStep(
        align: ContentAlign.top,
        identify: "scan",
        title: local.Recommendation,
        text: local.RecommendationDes,
        key: scanKey,
        shape: ShapeLightFocus.Circle,
      ),
      TutorialStep(
        align: ContentAlign.top,
        identify: "Floating",
        title: local.Service,
        text: local.ServiceDes,
        key: floatingKey,
        shape: ShapeLightFocus.Circle,
      ),
    ];
  }
  static BoxDecoration boxDecoration = BoxDecoration(
    color: AppColors.backgroundColor,
    borderRadius: BorderRadius.circular(12),
    boxShadow: boxShadow
  
  );
  static List<BoxShadow>  boxShadow = [
      BoxShadow(
        color: Colors.grey.withAlpha(50),
        spreadRadius: 2,
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ];
  static Positioned positionedFilter = Positioned.fill(
    child: GestureDetector(
      onTap: () => kNavigationService.goBack(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );

  static const String passwordLogin = "passwordLogin";
  static const String passwordSignup = "passwordSignup";
  static const String passwordUser1 = "passwordUser1";
  static const String passwordUser2 = "passwordUser2";
  static const String kLoadingProductsFeatured = "productsFeatured";
  static const String kLoadingProductsPopular = "productsPopular";
}
