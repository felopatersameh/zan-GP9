import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Features/App/common/Orders/Presentation/Components/price_details_order.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import '../../Data/Models/get_order_model.dart';
import '../Cubit/orders_cubit.dart';
import 'action_buttons_orders.dart';
import 'build_header_with_order_number_and_date.dart';
import 'build_product_details_order.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../generated/l10n.dart';

class BuildViewOrdersProducts extends StatelessWidget {
  final List<GetOrderModel> orders;
  const BuildViewOrdersProducts({
    super.key,
    required this.local,
    required this.orders,
  });

  final S local;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AppConfig.physicsCustomScrollView,
      itemCount: orders.length,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: AppConstants.boxDecorationCard,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildHeaderWithOrderNumberAndDate(
                local: local,
                date: orders[index].createdAt!,
                name: orders[index].orderNumber,
              ),

              SizedBox(height: 12.h),

              ...List.generate(
                orders[index].items.length,
                (p0) => BuildProductDetailsOrder(
                  local: local,
                  productName: orders[index].items[p0].product!.name,
                  quantity: orders[index].items[p0].quantity.toString(),
                ),
              ),

              SizedBox(height: 12.h),

              // Price details
              PriceDetailsOrder(
                local: local,
                price: orders[index].subtotal,
                discount: orders[index].discount,
                deliveryCharge: orders[index].deliveryCharge,
                totalAmount: orders[index].grandTotal,
              ),
              SizedBox(height: 16.h),

              // Status indicator
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: orders[index].status == OrderStatus.completed.value
                      ? AppColors.success.withAlpha(30)
                      : orders[index].status != OrderStatus.canceled.value
                          ? AppColors.running.withAlpha(30)
                          : AppColors.error.withAlpha(30),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      orders[index].status == OrderStatus.completed.value
                          ? Icons.check_circle
                          :orders[index].status != OrderStatus.canceled.value
                              ? Icons.access_time_outlined : Icons.close,
                      color: orders[index].status == OrderStatus.completed.value
                          ? AppColors.success
                          : orders[index].status != OrderStatus.canceled.value
                              ? AppColors.running
                              : AppColors.error,
                      size: 16.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      orders[index].status,
                      style: AppTextStyles.bodySmallBold.copyWith(
                        color: orders[index].status ==
                                OrderStatus.completed.value
                            ? AppColors.success
                            : orders[index].status != OrderStatus.canceled.value
                                ? AppColors.running
                                : AppColors.error,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Action buttons
              ActionButtonsOrders(local: local,isShow: orders[index].status == OrderStatus.running.value),
            ],
          ),
        ),
      ),
    );
  }
}
