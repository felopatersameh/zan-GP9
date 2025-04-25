import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Config/Routes/route_name.dart';
import '../../../../../Core/Resources/app_colors.dart';
import '../../../../../Core/Resources/app_fonts.dart';
import '../../../../../Core/Resources/app_icons.dart';
import '../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../Core/Utils/Functions/show_bottom_sheet_methods.dart';
import '../../../../../main.dart';
import '../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../Cubit/user_cubit.dart';
import 'build_item_setting.dart';

class BuildBodySetting extends StatelessWidget {
  const BuildBodySetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return SliverFillRemaining(
      fillOverscroll: true,
      hasScrollBody: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSetting(local.Setting),
         context.isCarpenter?
          BuildItemSetting(
            title: local.WorkshopDashboard,
            icon: AppIcons.workshopDashboardDefualt,
            onTap: () {
              context.read<UserCubit>().getUserData();
              kNavigationService.navigateTo(AppRoutes.dashBoredMainScreen);
            },
          ):SizedBox(),
          BuildItemSetting(
            title: local.YourCard,
            icon: AppIcons.card,
            onTap: () {},
          ),
          BuildItemSetting(
            title: local.Security,
            icon: AppIcons.shield,
            onTap: () {},
          ),
          BuildItemSetting(
            title: local.Favourite,
            icon: AppIcons.heartsOutline,
            onTap: () {
              kNavigationService.navigateTo(AppRoutes.favorite);
            },
          ),
          BuildItemSetting(
            title: local.cart,
            icon: AppIcons.bag,
            onTap: () {
              kNavigationService.navigateTo(AppRoutes.cart);
            },
          ),
          BuildItemSetting(
            title: local.Languages,
            icon: AppIcons.globe,
            onTap: () => ShowBottomSheetMethods.showLanguage(context),
          ),
          BuildItemSetting(
            title: local.Info,
            icon: AppIcons.circleInfo,
            onTap: () {},
          ),
          context.isLogin?
          BuildItemSetting(
            title: local.Logout,
            icon: AppIcons.logout,
            onTap: () => context.read<UserCubit>().logout(),
          ): Expanded(
            child: Align(
              child: CustomBuildButtonApp(text: context.local.Login, backgroundColor: AppColors.secondaryColor, onPressed: () => kNavigationService.navigateTo(AppRoutes.authentication),isSpace: false,),
            ),
          )
,
        ],
      ),
    );
  }

  Padding _buildSetting(String local) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24).r,
        child: Text(
          local,
          style: AppTextStyles.h7Bold.copyWith(
            color: AppColors.grayscale60,
          ),
        ),
      );
}
