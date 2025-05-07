import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_colors.dart';
import 'package:zan/Core/Resources/app_fonts.dart';

class BuildStatusSectionCarpenter extends StatelessWidget {
  const BuildStatusSectionCarpenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatusItem(
            title: "Status",
            status: "Pending",
            color: AppColors.warning,
          ),
        ),
        Expanded(
          child: _buildStatusItem(
            title: "Completion",
            status: "Pending",
            color: AppColors.warning,
          ),
        ),
        Expanded(
          child: _buildStatusItem(
            title: "Payment",
            status: "Pending",
            color: AppColors.warning,
          ),
        ),
      ],
    );
  }

 Widget _buildStatusItem({
    required String title,
    required String status,
    required Color color,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.bodySmallBold,
          ),
          SizedBox(height: 4.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withAlpha(50),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: color, width: 1),
            ),
            child: Text(
              status,
              style: AppTextStyles.bodySmallBold.copyWith(color: color),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
