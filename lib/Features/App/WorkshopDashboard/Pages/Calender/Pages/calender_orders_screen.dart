import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../Widget/build_view_orderes.dart';
import '../Widget/view_card_orders.dart';
import '../Widget/calender_dashboread.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../Cubit/cubit/calender_orders_dash_board_state.dart';

import '../Cubit/cubit/calender_orders_dash_board_cubit.dart';
import '../Widget/view_list_pending_orders.dart';

class CalenderOrdersScreen extends StatelessWidget {
  const CalenderOrdersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return BlocBuilder<CalenderOrdersDashBoardCubit,
        CalenderOrdersDashBoardState>(
      builder: (context, state) => [
        CalenderDashboread(state: state),
        BuildViewOrderes(
          emptyText: local.no_today_orders,
          loading: false,
          orders: [],
          ordersWidget: ViewListPendingOrders(),
        ),
        BuildViewOrderes(
          emptyText: local.no_today_orders,
          loading: false,
          orders: [],
          ordersWidget: ViewCardOrders(),
        ),
      ].styledAppPages(),
    );
  }
}
