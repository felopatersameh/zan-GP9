import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../../../Config/Assets/image_svg.dart';
import '../../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../../Features/App/Service/Carpenter/presentation/Cubit/CarpenterService/carpenter_service_cubit.dart';

class BuildCalenderServices extends StatelessWidget {
  const BuildCalenderServices({
    super.key,
    required this.read,
    required this.watch,
  });

  final CarpenterServiceCubit read;
  final CarpenterServiceCubit watch;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: read.focusDay,
      firstDay: read.firstDay,
      lastDay: read.lastDay,
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.saturday,
      selectedDayPredicate: (day) => isSameDay(watch.state.selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) =>
          read.onDaySelected(selectedDay, focusedDay),
      headerVisible: true,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: AppTextStyles.bodySmallBold.copyWith(
          color: AppColors.primaryColor,
        ),
        weekendStyle: AppTextStyles.bodySmallBold.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: AppColors.secondaryColor,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: AppTextStyles.bodySmallBold.copyWith(
          color: AppColors.textColorBlack,
        ),
        weekendTextStyle: AppTextStyles.bodySmallBold.copyWith(
          color: AppColors.textColorBlack,
        ),
      ),
      headerStyle: HeaderStyle(
        titleTextStyle: AppTextStyles.h3Bold,
        formatButtonVisible: false,
        rightChevronIcon: BuildImageAssets(
          svg: AppImagesSvg.rightIcons,
        ),
        leftChevronIcon: BuildImageAssets(
          svg: AppImagesSvg.leftIcon,
        ),
      ),
    );
  }
}
