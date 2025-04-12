import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../Extensions/localizations_extension.dart';
import '../../../Config/Assets/image_png.dart';
import '../../Resources/app_colors.dart';
import '../../Resources/app_fonts.dart';

class TutorialHelper {
  final BuildContext context;
  final List<TutorialStep> steps;
  final dynamic Function()? onFinish;

  TutorialCoachMark? tutorialCoachMark;

  TutorialHelper(this.onFinish, {required this.context, required this.steps});

  void showTutorial(BuildContext context) {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      useSafeArea: true,
      colorShadow: AppColors.primaryColor.withAlpha(0x80),
      alignSkip: AlignmentDirectional.topEnd,
      textSkip: context.local.Skip ,
      paddingFocus: 10,
      opacityShadow: 0.7,
      pulseAnimationDuration: Duration(milliseconds: 200),
      onFinish: onFinish,
      onSkip: () {
        onFinish?.call();
        return true;
      },
    )..show(context: context);
  }

  List<TargetFocus> _createTargets() {
    return steps.map((step) {
      return TargetFocus(
        identify: step.identify,
        keyTarget: step.key,
        shape: step.shape ?? ShapeLightFocus.RRect,
        radius: step.radius ?? 10,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: step.align ?? ContentAlign.top,
            child: Container(
              height: 270.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
              ),
              padding: EdgeInsets.all(16).w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      AppImagesPng.carpenter,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          maxLines: step.title.length,
                          style: AppTextStyles.h6Bold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          step.text,
                          maxLines: step.text.length,
                          style: AppTextStyles.bodyLargeMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        12.horizontalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }).toList();
  }
}

class TutorialStep {
  final String identify;
  final String title;
  final String text;
  final GlobalKey key;
  final ContentAlign? align;
  final ShapeLightFocus? shape;
  final double? radius;

  TutorialStep({
    required this.identify,
    required this.title,
    required this.text,
    required this.key,
    this.align,
    this.shape,
    this.radius,
  });
}
