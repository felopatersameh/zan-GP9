import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Resources/app_colors.dart';
import '../../../../../Core/Resources/app_fonts.dart';
import '../../../../../Core/Utils/Extensions/localizations_extension.dart';

class UploadImagesCarpenter extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final Function()? onTap;
  const UploadImagesCarpenter({
    super.key,
    required this.title,
    required this.description,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyLargeBold,
        ),
        10.verticalSpace,
        InkWell(
          onTap: onTap,
          child: Container(
            width: 294.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: BorderRadius.circular(81.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 100.w,
                  color: AppColors.primaryColor,
                  child: Center(
                      child: Text(
                    context.local.UploadImage,
                    style: AppTextStyles.bodyMediumBold
                        .copyWith(color: AppColors.textColorWhite),
                  )),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        image??context.local.NoImageSelected,
                        style: AppTextStyles.bodyMediumMedium
                            .copyWith(color: AppColors.textColorBlack),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            description,
            style: AppTextStyles.bodyMediumMedium
                .copyWith(color: AppColors.grayscale80),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
