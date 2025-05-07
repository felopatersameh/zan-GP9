import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import '../Cubit/orders_cubit.dart';


class BuildRegularTabs extends StatelessWidget {
  const BuildRegularTabs({
    super.key,
    required TabController mainTabController,
  }) : _mainTabController = mainTabController;

  final TabController _mainTabController;

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      controller: _mainTabController,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5).r,
        boxShadow: AppConstants.boxShadow,
      ),
      buttonMargin: EdgeInsets.symmetric(horizontal: 8.w),
      physics: AppConfig.physicsCustomScrollView,
      unselectedBackgroundColor: AppColors.backgroundColor,
      borderWidth: 1.w,
      borderColor: AppColors.grayscale30,
      unselectedBorderColor: AppColors.grayscale30,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.grayscale60,
        fontWeight: FontWeight.bold,
      ),
      radius: 5.r,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 22.5,
        vertical: 8,
      ).w,
      contentCenter: true,
      tabs: context
          .read<OrdersCubit>()
          .getTabLabels(context)
          .map((label) => Tab(text: label))
          .toList(),
    );
  }
}
