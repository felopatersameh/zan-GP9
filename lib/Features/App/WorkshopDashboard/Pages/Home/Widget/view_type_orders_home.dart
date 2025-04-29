import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import '../../../../../../Core/Resources/app_fonts.dart';

import '../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';

class ViewTypeOrdersHome extends StatelessWidget {
  final String title;
  final String emptyText;
  final Widget? list;

  const ViewTypeOrdersHome({
    super.key,
    required this.title,
    required this.emptyText,
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BuildAnimatedviewListBox(
        index: 0,
        child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: AppConstants.boxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 250.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConfig.customPaddingFromRightLeft,
                          vertical: 10.h),
                      child: Text(
                        title,
                        style: AppTextStyles.h5Bold
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0.w,
                    ),
                    Expanded(
                      child: list != null
                          ? SizedBox(
                              height: 200.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: AppConfig.physicsCustomScrollView,
                                itemCount: 2,
                                itemBuilder: (context, index) =>
                                    BuildAnimatedviewListBox(
                                  index: index,
                                  child: list!,
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                                emptyText,
                                style: AppTextStyles.bodyLargeBold
                                    .copyWith(color: AppColors.secondaryColor),
                              ),
                            ),
                    ),
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
