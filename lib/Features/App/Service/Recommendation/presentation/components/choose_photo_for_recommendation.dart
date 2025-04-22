// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';

import '../../../../../../generated/l10n.dart';

import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../Cubit/recommendation_cubit.dart';

class ChoosePhotoForRecommendation extends StatelessWidget {
  const ChoosePhotoForRecommendation({
    super.key,
    required this.local,
  });

  final S local;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppConfig.customPadding,
        child: Column(
          children: [
            context.watch<RecommendationCubit>().state.image != null
                ? BuildImageAssets(
                    file: context.read<RecommendationCubit>().showphoto,
                    height: 500.h,
                    fit: BoxFit.contain,
                  )
                : SizedBox(),
            Row(
              children: [
                Expanded(
                  child: CustomBuildButtonApp(
                    radius: 0,
                    size: Size(50, 100),
                    text: local.Photo,
                    isSpace: false,
                    textColor: AppColors.textColorBlack,
                    backgroundColor: AppColors.backgroundColor,
                    onPressed: () => context
                        .read<RecommendationCubit>()
                        .takePhotoFromGallery(),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: CustomBuildButtonApp(
                    radius: 0,
                    size: Size(50, 100),
                    text: local.Camera,
                    textColor: AppColors.textColorBlack,
                    isSpace: false,
                    backgroundColor: AppColors.backgroundColor,
                    onPressed: () => context
                        .read<RecommendationCubit>()
                        .takePhotoFromCamera(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
