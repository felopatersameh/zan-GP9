import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Config/app_config.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import 'action_buttons_orders.dart';
import 'build_header_with_order_number_and_date.dart';
import 'build_status_section_carpenter.dart';
import 'custom_text_rich.dart';
import '../../../../../../generated/l10n.dart';

class BuildViewOrdersCarpenter extends StatelessWidget {
  const BuildViewOrdersCarpenter({
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
          decoration:AppConstants.boxDecorationCard,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildHeaderWithOrderNumberAndDate(
                local: local,
                date: DateTime.now(),
                name: "",
              ),

              SizedBox(height: 12.h),

              CustomTextRich(
                title: local.ServiceName,
                subTitle: "تركيب دولاب جاهز",
                isprice: false,
              ),

              CustomTextRich(
                title: local.Price,
                subTitle: "99593",
                isprice: true,
              ),

              Divider(height: 16.h),

              BuildStatusSectionCarpenter(),
              SizedBox(height: 16.h),

              ActionButtonsOrders(local: local,isShow:  true),
            ],
          ),
        ), 
      ),
    );
  }

 
}
