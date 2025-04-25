import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../Core/Resources/app_icons.dart';
import '../../../../../../../Core/Resources/app_colors.dart';
class TitleCarpenterServiceScreen extends StatelessWidget {
  const TitleCarpenterServiceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return Column(
        children: [
          Row(
            children: [
              AppIcons.carpenter,
              30.horizontalSpace,
              Text(
                local.Carpenter,
                style: AppTextStyles.h3Bold,
              ),

              // BuildSocialLoginButton(
              //   size: Size(112.w, 40.h),
              //   text: 'Custom',
              //   backgroundColor: AppColors.grayscale10,
              //   isSpace: false,
              //   onPressed: () {},
              //   textColor: AppColors.primaryColor,
              // )
            ],
          ),
          20.verticalSpace,
          Text(
            local.Carpentry_selection,
            style: AppTextStyles.bodyXtraLargeBold
                .copyWith(color: AppColors.grayscale60),
          )
        ],
      );
  }
}
