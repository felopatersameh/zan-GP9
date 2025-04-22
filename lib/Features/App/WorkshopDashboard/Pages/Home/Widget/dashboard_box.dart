import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';

class DashboredBox extends StatelessWidget {
  const DashboredBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 100.h,
      padding:
          EdgeInsets.symmetric(vertical: AppConfig.customPaddingFromTopBottom),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.h6Bold.copyWith(
            color: color,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.bodyLargeBold.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
