import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../Cubit/orders_cubit.dart';

class BuildSuperTab extends StatelessWidget {
  final OrdersState state;
  const BuildSuperTab({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(
          context.read<OrdersCubit>().supTabs(context).length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                // Update the supTab in the cubit
                context.read<OrdersCubit>().changeSupTab(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: state.selectedSupTabIndex == index
                      ? AppColors.secondaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    context.read<OrdersCubit>().supTabs(context)[index],
                    style: TextStyle(
                      color: state.selectedSupTabIndex == index
                          ? Colors.white
                          : AppColors.grayscale60,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
