import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Features/App/common/Orders/Presentation/Components/price_details_order.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import 'action_buttons_orders.dart';
import 'build_header_with_order_number_and_date.dart';
import 'build_product_details_order.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../generated/l10n.dart';

class BuildViewOrdersProducts extends StatelessWidget {
  const BuildViewOrdersProducts({
    super.key,
    required this.local,
  });

  final S local;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AppConfig.physicsCustomScrollView,
      itemCount: 5,
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
              BuildHeaderWithOrderNumberAndDate(local: local),

              SizedBox(height: 12.h),

              BuildProductDetailsOrder(local: local),

              SizedBox(height: 12.h),

              // Price details
PriceDetailsOrder(local: local),
              SizedBox(height: 16.h),

              // Status indicator
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColors.success.withAlpha(30),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 16.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Delivered",
                      style: AppTextStyles.bodySmallBold.copyWith(
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Action buttons
              ActionButtonsOrders(local: local),
            ],
          ),
        ),
      ),
    );
  }
}
