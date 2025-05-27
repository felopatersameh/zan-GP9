import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_fonts.dart';
import 'package:zan/generated/l10n.dart';

class BuildProductDetailsOrder extends StatelessWidget {
  final String productName;
  final String quantity;
  const BuildProductDetailsOrder({
    super.key,
    required this.local, required this.productName, required this.quantity,
  });

  final S local;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade200),
              // image: DecorationImage(
              //   image: NetworkImage('https://via.placeholder.com/80'),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: AppTextStyles.bodyMediumBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  "${local.Quantity}: $quantity",
                                     style: AppTextStyles.bodySmallSemiBold,
      
      
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
