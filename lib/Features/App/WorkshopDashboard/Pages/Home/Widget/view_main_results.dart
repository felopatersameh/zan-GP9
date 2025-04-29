import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Utils/Extensions/context_extension.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../Calender/Widget/build_view_orderes.dart';
import '../../Calender/Widget/view_card_orders.dart';
import '../../Calender/Widget/view_list_pending_orders.dart';
import '../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Resources/app_list.dart';
import 'dashboard_box.dart';

class ViewMainResults extends StatelessWidget {
  const ViewMainResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return SliverToBoxAdapter(
      child: Column(
        spacing: 30.h,
        children: [
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1.5),
            itemCount: AppList.dashboardBoxConfigs(local).length,
            itemBuilder: (context, index) {
              final boxConfigs = AppList.dashboardBoxConfigs(local);
              return BuildAnimatedviewListBox(
                index: index,
                child: GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        // print('Total Earnings');
                        break;
                      case 1:
                        context.buildCustomBottomSheet(
                          widget: [
                            BuildViewOrderes(emptyText: local.completed_orders, loading: false, ordersWidget: ViewCardOrders())
                          ].styledAppPages(withScaffold: true)
                        );
                        break;
                      case 2:
                        // print('Rating');
                        break;
                      case 3:
                      context.buildCustomBottomSheet(
                          widget: [
                            BuildViewOrderes(emptyText: local.pending_orders, loading: false, ordersWidget: ViewListPendingOrders())
                          ].styledAppPages(withScaffold: true)
                        );
                        break;
                      case 4:
                        // print('Pending Orders');
                        break;
                    }
                  },
                  child: BuildAnimatedviewListBox(
                    index: index,
                    child: DashboredBox(
                      title: boxConfigs[index].title,
                      subtitle: boxConfigs[index].subtitle,
                      color: boxConfigs[index].color,
                    ),
                  ),
                ),
              );
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
