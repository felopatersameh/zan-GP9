import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';

class ViewActionsButtonsOrder extends StatelessWidget {
  const ViewActionsButtonsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = Size(90, 30);
    final double radius = 0;
    final bool isSpace = false;
    final local = context.local;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBuildButtonApp(
            size: size,
            text: local.accept,
            isSpace: isSpace,
            backgroundColor: AppColors.dashboardColor2,
            onPressed: () {},
            radius: radius,
          ),
          SizedBox(width: 15.w),
          CustomBuildButtonApp(
            size: size,
            text: local.reject,
            isSpace: isSpace,
            backgroundColor: AppColors.error,
            onPressed: () {},
            radius: radius,
          ),
          SizedBox(width: 15.w),
          CustomBuildButtonApp(
            size: size,
            text: local.delay,
            isSpace: isSpace,
            backgroundColor: AppColors.warning,
            onPressed: () {},
            radius: radius,
          ),
        ],
      ),
    );
  }
}
