import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Utils/Widget/Images/view_image_user.dart';
import '../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../Cubit/user_cubit.dart';
import '../../../../../Config/Routes/route_name.dart';
import '../../../../../main.dart';

import '../../../../../Core/Resources/app_colors.dart';
import '../../../../../Core/Resources/app_fonts.dart';
import '../../../../../Core/Resources/app_icons.dart';

class BuildUserDataAppBar extends StatelessWidget {
  const BuildUserDataAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 35).w,
        minVerticalPadding: 0,
        style: ListTileStyle.drawer,
        title: Text(
          context.watch<UserCubit>().state.userDataModel.name,
          style: AppTextStyles.h6Bold,
        ),
        subtitle: Text(
          "${context.watch<UserCubit>().state.userDataModel.email.split("@").first}@",
          style: AppTextStyles.bodyMediumMedium.copyWith(
            color: AppColors.grayscale80,
          ),
        ),
        minLeadingWidth: 50.w,
        leading: GestureDetector(
          onTap: () {
            kNavigationService.navigateTo(AppRoutes.imageView,arguments: context.read<UserCubit>().state.userDataModel.photoUrl);
          },
          child: ViewImageUser(),
        ),
        trailing: context.isLogin
            ? GestureDetector(
                onTap: () {
                  kNavigationService.navigateTo(AppRoutes.userEditeScreen);
                },
                child: AppIcons.edit)
            : null,
      ),
    );
  }
}
