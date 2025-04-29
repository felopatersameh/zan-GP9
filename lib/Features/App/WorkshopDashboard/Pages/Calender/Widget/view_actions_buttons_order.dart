import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_colors.dart';
import 'package:zan/Features/Global/Authentication/presentation/components/build_social_login_button.dart';

class ViewActionsButtonsOrder extends StatelessWidget {
  const ViewActionsButtonsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = Size(90, 30);
    final double radius = 0;
    final bool isSpace = false;
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15.w,
          children: [
            CustomBuildButtonApp(
              size: size,
              text: "قبول",
              isSpace: isSpace,
              backgroundColor: AppColors.dashboardColor2,
              onPressed: () {},
              radius: radius,
            ),
            CustomBuildButtonApp(
              size: size,
              text: "رفض",
              isSpace: isSpace,
              backgroundColor: AppColors.error,
              onPressed: () {},
              radius: radius,
            ),
            CustomBuildButtonApp(
              size: size,
              text: "تاجيل",
              isSpace: isSpace,
              backgroundColor: AppColors.warning,
              onPressed: () {},
              radius: radius,
            ),
          ],
        ),
      ),
    );
  }
}
