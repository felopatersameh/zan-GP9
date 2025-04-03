import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'switch_pages_authentications.dart';
import '../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../Cubit/AnimatedCrossFade/animated_cross_fade_cubit.dart';
import '../../../../../Config/Assets/image_png.dart';
import '../../../../../Config/Routes/route_name.dart';
import '../../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../../../../../Core/Resources/app_fonts.dart';
import '../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../Core/Utils/Extensions/context_extension.dart';

import '../../../../../Core/Resources/app_colors.dart';

class ContainerAuthenticationBody extends StatelessWidget {
  const ContainerAuthenticationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSmall = context.isSmallScreen;
    final local = context.local;
    return Align(
      child: Container(
        margin: EdgeInsets.all(20).w,
        padding: EdgeInsets.all(5).w,
        width: isSmall ? 1.sw : .5.sw,
        height:
            context.watch<AnimatedCrossFadeCubit>().state.screenContainerHeight,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(25).r,
        ),
        child: [
          SliverToBoxAdapter(
            child: _buildTitleSplit(local),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: SwitchPagesAuthentications(),
          )
        ].styledAppPages(withScroll: true),
      ),
    );
  }

  Container _buildTitleSplit(S local) => Container(
        padding: EdgeInsets.all(0).w,
        width: 318.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                30.horizontalSpace,
                InkWell(
                    onTap: ()  {
                       LocalStorageService.setValue(
                        LocalStorageKeys.isFirstTime,
                        true,
                      );

                      kNavigationService.clearAndNavigateTo(AppRoutes.main);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.x,
                      color: AppColors.primaryColor,
                      shadows: [
                        Shadow(
                          color: AppColors.grayscale60,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                        ),
                      ],
                    )),
              ],
            ),
            Image.asset(
              AppImagesPng.icon,
            ),
            Text(
              local.TitleStartApp,
              softWrap: true,
              style: AppTextStyles.h7Bold,
              textAlign: TextAlign.center,
              maxLines: local.TitleStartApp.length,
            ),
          ],
        ),
      );
}
