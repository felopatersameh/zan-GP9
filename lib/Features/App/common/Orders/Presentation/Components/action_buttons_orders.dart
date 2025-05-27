import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_colors.dart';
import 'package:zan/Features/Global/Authentication/presentation/components/build_social_login_button.dart';
import 'package:zan/generated/l10n.dart';

class ActionButtonsOrders extends StatelessWidget {
  final bool isShow;
  const ActionButtonsOrders({
    super.key,
    required this.local, required this.isShow,
  });

  final S local;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       isShow? Expanded(
          child: CustomBuildButtonApp(
            size: Size(double.infinity, 40.h),
            text: local.cancel,
            backgroundColor: AppColors.error,
            onPressed: () {},
            isSpace: false,
          ),
        ):SizedBox(),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomBuildButtonApp(
            size: Size(double.infinity, 40.h),
            text: local.ViewOrders,
            backgroundColor: AppColors.backgroundColor,
            radiusColor: AppColors.primaryColor,
            textColor: AppColors.textColorBlack,
            onPressed: () {},
            isSpace: false,
          ),
        ),
      ],
    );
  }
}
