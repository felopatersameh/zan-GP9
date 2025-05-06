import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../Core/Utils/Widget/AppBar/default_app_bar.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../generated/l10n.dart';
import '../Widget/view_actions_buttons_order.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    final randomStatus =
        OrderStatus.values[Random().nextInt(OrderStatus.values.length)];
    return [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            randomStatus == OrderStatus.pending
                ? SizedBox(
                    width: double.infinity,
                    child: ViewActionsButtonsOrder(),
                  )
                : SizedBox(),
            _buildStatusCard(local, randomStatus),
            20.verticalSpace,
            _buildServiceInfoCard(local),
            20.verticalSpace,
            _buildUserInfoCard(local),
            20.verticalSpace,
            _buildLocationCard(local),
          ],
        ),
      )
    ].styledAppPages(
        withAll: true,
        appbar: true,
        widgetAppbar: DefaultAppBar(local: local.OrderDetails));
  }

  Widget _buildStatusCard(S local, OrderStatus status) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      color: status.color.withAlpha(200),
      child: Container(
        padding: EdgeInsets.all(16.r),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.OrderStatus,
              style: AppTextStyles.h4Bold,
            ),
            10.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 6.r),
              decoration: BoxDecoration(
                color: status.color.withAlpha(250),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                getStatusText(status, local),
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getStatusText(OrderStatus status, S local) {
    if (status == OrderStatus.accepeted) {
      return local.accepted;
    } else if (status == OrderStatus.pending) {
      return local.pending;
    } else {
      return local.running;
    }
  }

  Widget _buildServiceInfoCard(S local) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      color: AppColors.backgroundColor,
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.ServiceInformation,
              style: AppTextStyles.h4Bold,
            ),
            10.verticalSpace,
            // _buildInfoRow("Service Type:", "Carpenter Service"),
            _buildInfoRow("${local.ServiceName}:", "Furniture Assembly"),
            _buildInfoRow("${local.Date}:", "July 15, 2024"),
            _buildInfoRow("${(local.Time)}:", "10:00 AM - 12:00 PM"),
            _buildInfoRow("${local.Price}:", "120 EGP"),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoCard(S local) {
    return Card(
      elevation: 4,
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.CustomerInformation,
              style: AppTextStyles.h4Bold,
            ),
            BuildImageAssets(
              setDefaultImage: true,
              height: 70,
            ),
            10.verticalSpace,
            _buildInfoRow("${local.name}:", "John Doe"),
            _buildInfoRow("${local.phone}:", "+1 234 567 8900"),
            _buildInfoRow("${local.email}:", "john.doe@example.com"),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard(S local) {
    return Card(
      elevation: 4,
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.LocationInformation,
              style: AppTextStyles.h4Bold,
            ),
            10.verticalSpace,
            _buildInfoRow("${local.area}:", "123 Main Street, Apt 4B"),
            _buildInfoRow("${local.city}:", "New York"),
            _buildInfoRow("${local.postal_code}:", "10001"),
            10.verticalSpace,
            Align(
                child: CustomBuildButtonApp(
              text: local.Address,
              backgroundColor: AppColors.secondaryColor,
              onPressed: () {},
              isSpace: false,
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: AppTextStyles.bodyMediumBold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMediumMedium,
            ),
          ),
        ],
      ),
    );
  }
}

enum OrderStatus {
  accepeted(color: AppColors.success),
  running(color: AppColors.running),
  pending(color: AppColors.warning);

  final Color color;

  const OrderStatus({required this.color});
}
