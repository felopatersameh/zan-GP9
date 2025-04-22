import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Resources/app_list.dart';
import '../../../../../Core/Utils/Widget/build_bottom_navigation_bar.dart';
import '../Cubit/dashboard_cubit.dart';

class BuildBottomNavigatorDashBored extends StatelessWidget {
  const BuildBottomNavigatorDashBored({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildBottomNavigationBar(
      initialIndex: context.watch<DashboardCubit>().state.currentIndex,
      enableActiveIcon: false,
      onTap: (i) => context.read<DashboardCubit>().changeIndex(i),
      items: AppList.bottomNavigatorItemsDashBored,
    );
  }
}
