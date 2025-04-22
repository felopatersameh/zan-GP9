import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../Widget/monthly_sales_chart.dart';
import '../Widget/view_type_orders.dart';
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
      ViewTypeOrders(
          title: local.today_orders, emptyText: local.no_today_orders),
      ViewTypeOrders(title: local.pending_orders, emptyText: local.no_pending_orders),
      MonthlySalesChart(),
    ].styledAppPages(withPadding: true, withScroll: true);
  }
}
