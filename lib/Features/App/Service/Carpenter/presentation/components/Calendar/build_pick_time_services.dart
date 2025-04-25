import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../Features/App/Service/Carpenter/presentation/Cubit/CarpenterService/carpenter_service_cubit.dart';
import '../../../../../../../generated/l10n.dart';

class BuildPickTimeServices extends StatelessWidget {
  const BuildPickTimeServices({
    super.key,
    required this.local,
    required this.read,
    required this.watch,
  });

  final S local;
  final CarpenterServiceCubit read;
  final CarpenterServiceCubit watch;

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          local.PickTime,
          style:  AppTextStyles.h6Medium.copyWith(color: AppColors.grayscale70),
        ),
        10.verticalSpace,
        // Wrap(
        //   children: read.timePeriods.map((period) {
        //     return Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 8).r,
        //       child: ChoiceChip(
        //        showCheckmark: false,
        //         label: Text(period),
        //         selected: watch.state.selectedTimePeriod == period,
        //         onSelected: (_)=>read.onTimePeriodSelected(period),
        //         selectedColor: AppColors.primaryColor,
        //         backgroundColor: AppColors.grayscale10,
        //         labelStyle:  AppTextStyles.bodyLargeBold.copyWith(color: watch.state.selectedTimePeriod == period
        //             ? AppColors.textColorWhite : AppColors.textColorBlack)
        //       ),
        //     );
        //   }).toList(),
        // ),
        //
        // 15.verticalSpace,
        Wrap(
          spacing: 10.w,
          children:  read.times.map((time) {
            return ChoiceChip(
                showCheckmark: false,
              label: Text(time),
              selected: watch.state.selectedTime == time,
              onSelected: (_) => read.onTimeSelected(time),
              selectedColor: AppColors.primaryColor,
              backgroundColor: AppColors.grayscale10,
              labelStyle:AppTextStyles.bodyLargeSemiBold.copyWith(color:watch.state.selectedTime == time ? AppColors.textColorWhite : AppColors.textColorBlack)
            );
          }).toList(),
        ),
      ],
    );
  }
}
