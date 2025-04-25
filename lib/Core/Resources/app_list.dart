import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../Utils/Extensions/localizations_extension.dart';
import '../../Features/App/WorkshopDashboard/Data/dashboard_box_model.dart';
import '../../Features/Global/Boarding/widgets/build_page_view_model.dart';
import '../../generated/l10n.dart';
import 'app_colors.dart';
import '../../Config/Assets/image_png.dart';
import 'app_icons.dart';

class AppList {
  static List<PageViewModel> buildPagesIntroductionScreen(S local) {
    return [
      buildPageViewModel(
        title: local.boarding1_title,
        body: local.boarding1_body,
        image: AppImagesPng.boarding1,
      ),
      buildPageViewModel(
        title: local.boarding2_title,
        body: local.boarding2_body,
        image: AppImagesPng.boarding2,
      ),
      buildPageViewModel(
        title: local.boarding3_title,
        body: local.boarding3_body,
        image: AppImagesPng.boarding3,
      ),
    ];
  }

  static List<Widget> gradientColorsBackground = [
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.gradientColors,
          tileMode: TileMode.repeated,
        ),
      ),
    ),
    Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        blendMode: BlendMode.darken,
        child: Container(
          color: AppColors.textColorBlack.withAlpha(0x40),
        ),
      ),
    ),
  ];

  static List<DashboardBoxConfig> dashboardBoxConfigs(S local) => [
        DashboardBoxConfig(
            title: local.total_earnings,
            subtitle: '100',
            icon: Icon(Icons.shopping_cart),
            color: AppColors.dashboardColor1,
            buttonText: 'View Details'),
        DashboardBoxConfig(
            title: local.completed_orders,
            subtitle: '100',
            icon: Icon(Icons.shopping_cart),
            color: AppColors.dashboardColor2,
            buttonText: 'View All'),
        DashboardBoxConfig(
            title: local.rating,
            subtitle: '100',
            icon: Icon(Icons.star),
            color: AppColors.dashboardColor3,
            buttonText: 'Review'),
        DashboardBoxConfig(
            title: local.pending_orders,
            subtitle: '100',
            icon: Icon(Icons.star),
            color: AppColors.dashboardColor4,
            buttonText: 'View All'),
      ];

  static List<TabItem> bottomNavigatorItemsDashBored = [
    TabItem(
      icon: AppIcons.orderCarpenterDisActive,
      activeIcon: AppIcons.orderCarpenterActive,
    ),
    TabItem(
        icon: AppIcons.workshopDashboardMainScreen,
        activeIcon: AppIcons.workshopDashboardDefualt),
    TabItem(
      icon: AppIcons.profileOutline,
      activeIcon: AppIcons.profileFill,
    ),
  ];
  static List<TabItem> itemsNavBar({
    required BuildContext context,
    required Key scanKey,
  }) {
    final local = context.local;

    return [
      TabItem(
        icon: AppIcons.homeOutline,
        activeIcon: AppIcons.homeFill,
        title: local.Home,
      ),
      TabItem(
        icon: AppIcons.compassOutline,
        activeIcon: AppIcons.compassFill,
        title: local.Explore,
      ),
      TabItem(
        icon: Container(
          key: scanKey,
          child: AppIcons.scan,
        ),
        title: local.Scan,
      ),
      TabItem(
        icon: AppIcons.searchOutline,
        activeIcon: AppIcons.searchFill,
        title: local.Search,
      ),
      TabItem(
        icon: AppIcons.profileOutline,
        activeIcon: AppIcons.profileFill,
        title: local.Profile,
      ),
    ];
  }
}
