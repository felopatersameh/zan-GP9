import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_colors.dart';
import 'package:zan/Core/Resources/app_fonts.dart';
import 'package:zan/Features/App/common/Orders/Presentation/Components/custom_text_rich.dart';
import 'package:zan/generated/l10n.dart';

class BuildHeaderWithOrderNumberAndDate extends StatelessWidget {
  const BuildHeaderWithOrderNumberAndDate({
    super.key,
    required this.local,
  });

  final S local;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomTextRich(
              title: local.OrderNames,
              subTitle: "ORD-68113ACF6FE37",
              isprice: false,
              color: AppColors.textColorWhite,
            ),
          ),
          Text(
            "15 Jul 2023",
                                 style: AppTextStyles.bodySmallSemiBold.copyWith(color: AppColors.textColorWhite),
    
          ),
        ],
      ),
    );
  }
}
