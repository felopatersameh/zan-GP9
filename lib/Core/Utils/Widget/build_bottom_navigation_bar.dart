import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../Resources/app_colors.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  final int initialIndex;
  final List<TabItem> items;
  final Function(int) onTap;
  final bool Function(int)? onTabNotify;
  final bool? enableActiveIcon;
  const BuildBottomNavigationBar({
    super.key,
    required this.initialIndex,
    required this.items,
    required this.onTap,
    this.onTabNotify,
    this.enableActiveIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      elevation: 5,
      color: enableActiveIcon == false ? Colors.transparent : AppColors.grayscale70,
      activeColor: enableActiveIcon == true ? AppColors.primaryColor : null,
      backgroundColor: AppColors.backgroundColor,
      style: TabStyle.fixedCircle,
      initialActiveIndex: initialIndex,
      onTabNotify: onTabNotify,
      items: items,
      onTap: onTap,
    );
  }
}
