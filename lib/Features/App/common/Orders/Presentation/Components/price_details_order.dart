import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_colors.dart';
import 'package:zan/Core/Resources/app_fonts.dart';
import 'package:zan/generated/l10n.dart';

class PriceDetailsOrder extends StatelessWidget {
  final S local;
  final String price;
  final String discount;
  final String deliveryCharge;
  final String totalAmount;
  const PriceDetailsOrder({super.key, required this.local, required this.price, required this.discount, required this.deliveryCharge, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildPriceRow(
            title: local.Price,
            value: price,
            isTotal: false,
          ),
          Divider(height: 8.h),
          _buildPriceRow(
            title: local.Discount,
            value:discount,
            isTotal: false,
          ),
          Divider(height: 8.h),
          _buildPriceRow(
            title: local.DeliveryCharge,
            value: deliveryCharge,
            isTotal: false,
          ),
          Divider(height: 8.h),
          _buildPriceRow(
            title: local.TotalAmount,
            value: totalAmount,
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow({
    required String title,
    required String value,
    required bool isTotal,
  }) {
    final TextStyle titleStyle = isTotal
        ? AppTextStyles.bodyMediumBold
        : AppTextStyles.bodySmallSemiBold;
    final TextStyle valueStyle = isTotal
        ? AppTextStyles.bodyMediumBold.copyWith(color: AppColors.primaryColor)
        : AppTextStyles.bodySmallBold;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle),
        Text("${value.replaceAll(".00", ".0")} EGP", style: valueStyle),
      ],
    );
  }
}
