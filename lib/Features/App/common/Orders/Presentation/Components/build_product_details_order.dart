import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Resources/app_fonts.dart';
import 'package:zan/generated/l10n.dart';

class BuildProductDetailsOrder extends StatelessWidget {
  const BuildProductDetailsOrder({
    super.key,
    required this.local,
  });

  final S local;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                "Product Name",
                style: AppTextStyles.bodyMediumBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                "${local.Quantity}: 2",
                                   style: AppTextStyles.bodySmallSemiBold,
    
    
              ),
            ],
          ),
        ),
      ],
    );
  }
}
