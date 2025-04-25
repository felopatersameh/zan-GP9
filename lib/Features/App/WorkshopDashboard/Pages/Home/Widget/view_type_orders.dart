import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import '../../../../../../Core/Resources/app_fonts.dart';

import '../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';

class ViewTypeOrders extends StatelessWidget {
  final String title;
  final String emptyText;
  
  const ViewTypeOrders({
    super.key,
    required this.title,
    required this.emptyText,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BuildAnimatedviewListBox(
        index:0,
        child: Container(
            
          padding:
        EdgeInsets.symmetric(horizontal: AppConfig.customPaddingFromRightLeft,vertical: 10.h),
        margin: EdgeInsets.only(bottom: 20.h),
          decoration: AppConstants.boxDecoration,

          
            
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        SizedBox(
          height: .13.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: AppTextStyles.h5Bold.copyWith(color: AppColors.primaryColor),),
                  Divider(indent:0,endIndent: 0.w,),
                  Expanded(child: Center(
                    child: Text(emptyText,style: AppTextStyles.bodyLargeBold.copyWith(color: AppColors.secondaryColor),),
                  ), ),
                ],
          ),
        ),
             
            ],
            ),
        ),
      ),
    );
  }
}