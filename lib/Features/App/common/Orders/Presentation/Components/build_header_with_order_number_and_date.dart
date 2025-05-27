import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import 'custom_text_rich.dart';
import '../../../../../../generated/l10n.dart';

class BuildHeaderWithOrderNumberAndDate extends StatelessWidget {
  final String name;
  final DateTime date;
  const BuildHeaderWithOrderNumberAndDate({
    super.key,
    required this.local, required this.name, required this.date,
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
              subTitle: name,
              isprice: false,
              color: AppColors.textColorWhite,
            ),
          ),
          Text(
            DateFormat.yMMMMEEEEd().format(date),
            style: AppTextStyles.bodySmallSemiBold
                .copyWith(color: AppColors.textColorWhite),
          ),
        ],
      ),
    );
  }
}
