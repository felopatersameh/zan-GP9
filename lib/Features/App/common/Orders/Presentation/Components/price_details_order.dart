import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_colors.dart';
import 'package:zan/Core/Resources/app_fonts.dart';
import 'package:zan/generated/l10n.dart';

class PriceDetailsOrder extends StatelessWidget {
  final S local;
  const PriceDetailsOrder({super.key, required this.local});

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
            value: "99593",
            isTotal: false,
          ),
          Divider(height: 8.h),
          _buildPriceRow(
            title: local.Discount,
            value: "0.0",
            isTotal: false,
          ),
          Divider(height: 8.h),
          _buildPriceRow(
            title: local.DeliveryCharge,
            value: "5",
            isTotal: false,
          ),
          Divider(height: 8.h),
          _buildPriceRow(
            title: local.TotalAmount,
            value: "99598",
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
        Text("$value EGP", style: valueStyle),
      ],
    );
  }
}
