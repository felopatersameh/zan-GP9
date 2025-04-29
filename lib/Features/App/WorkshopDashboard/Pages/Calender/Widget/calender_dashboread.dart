import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../../Config/Assets/image_svg.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../Cubit/cubit/calender_orders_dash_board_cubit.dart';
import '../Cubit/cubit/calender_orders_dash_board_state.dart';

class CalenderDashboread extends StatelessWidget {
  const CalenderDashboread({
    super.key,
    required this.state,
  });

  final CalenderOrdersDashBoardState state;

  @override
  Widget build(BuildContext context) {
    final read = context.read<CalenderOrdersDashBoardCubit>();
    final watch = context.watch<CalenderOrdersDashBoardCubit>();
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: AppConstants.boxDecoration,
        child: TableCalendar(
          focusedDay: state.selectedDay ?? watch.focusDay,
          firstDay: read.firstDay(context),
          lastDay: read.lastDay,
          calendarFormat: CalendarFormat.week,
          selectedDayPredicate: (day) =>
              isSameDay(watch.state.selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) =>
              read.onDaySelected(selectedDay, focusedDay),
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
              boxShadow: AppConstants.boxShadow,
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              boxShadow: AppConstants.boxShadow,
              color: AppColors.secondaryColor,
              shape: BoxShape.circle,
            ),
            defaultTextStyle: AppTextStyles.bodySmallBold
                .copyWith(color: AppColors.textColorBlack),
            weekendTextStyle: AppTextStyles.bodySmallBold
                .copyWith(color: AppColors.textColorBlack),
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
        ),
      ),
    );
  }
}
