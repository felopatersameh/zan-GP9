import 'package:flutter/material.dart';
import 'package:zan/Core/Resources/app_constants.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../Calender/Widget/view_card_orders.dart';
import '../../Calender/Widget/view_list_pending_orders.dart';
import '../Widget/monthly_sales_chart.dart';
import '../Widget/view_type_orders_home.dart';
import '../Widget/view_main_results.dart';
import '../Widget/carpenter_profile_status.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';

class HomeDashboardPages extends StatelessWidget {
  const HomeDashboardPages({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return [
      CarpenterProfileStatus(),
      ViewMainResults(),
      ViewTypeOrdersHome(
        title: local.today_orders,
        emptyText: local.no_today_orders,
        list: Container(
            margin: EdgeInsets.all(15),
            decoration: AppConstants.boxDecoration,
            child: ViewCardOrders()),
      ),
      ViewTypeOrdersHome(
        title: local.pending_orders,
        emptyText: local.no_pending_orders,
        list: ViewListPendingOrders(),
      ),
      MonthlySalesChart(),
    ].styledAppPages(withPadding: true, withScroll: true);
  }
}
