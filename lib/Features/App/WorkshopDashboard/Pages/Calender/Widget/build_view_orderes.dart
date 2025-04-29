import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';
import '../../../../../../Core/Utils/Widget/Animations/loading_animation.dart';
import '../Cubit/cubit/calender_orders_dash_board_cubit.dart';

class BuildViewOrderes extends StatelessWidget {
  final String emptyText;
  final bool loading;
  final List? orders;
  final Widget ordersWidget;
  const BuildViewOrderes({
    super.key,
    required this.emptyText,
    required this.loading,
     this.orders,
    required this.ordersWidget,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? SliverFillRemaining(child: CustomLoadingAnimation())
        : context.read<CalenderOrdersDashBoardCubit>().state.selectedDay == null
            ? SliverFillRemaining(
                child: Center(
                  child: Text(
                    emptyText,
                    style: AppTextStyles.bodyLargeBold
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                ),
              )
            : SliverList.builder(
                itemBuilder: (context, index) => BuildAnimatedviewListBox(
                  index: index,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: AppConstants.boxDecoration,
                    child: ordersWidget,
                  ),
                ),
                itemCount: ((context
                                .watch<CalenderOrdersDashBoardCubit>()
                                .state
                                .selectedDay
                                ?.day ??
                            0) *
                        .1)
                    .toInt(),
              );
  }
}
