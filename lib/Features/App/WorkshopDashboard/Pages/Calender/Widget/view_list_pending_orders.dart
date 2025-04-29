import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view_actions_buttons_order.dart';
import 'view_card_orders.dart';
import '../../../../../../Core/Resources/app_constants.dart';

class ViewListPendingOrders extends StatelessWidget {
  const ViewListPendingOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: AppConstants.boxDecoration,
      child: SizedBox(
        height: 150.h,
        child: Column(
          children: [
            ViewCardOrders(),
            ViewActionsButtonsOrder(),
          ],
        ),
      ),
    );
  }
}
