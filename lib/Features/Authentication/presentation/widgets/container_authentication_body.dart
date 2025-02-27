import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Config/Assets/image_svg.dart';
import '../../../../Config/Assets/image_png.dart';
import '../../../../Config/Routes/route_name.dart';
import '../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../../../Core/Resources/app_fonts.dart';
import '../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../Core/Utils/Extensions/context_extension.dart';

import '../../../../Core/Resources/app_colors.dart';
import 'build_social_login_button.dart';


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
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(20).w,
        width: isSmall ? 1.sw : .5.sw,
        height: .7.sh,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(25).r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildTitleSplit(local),
            Column(
              spacing: 8.h,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildSocialLoginButton(
                  imagePath: AppImagesPng.apple,
                  text: local.LoginByApple,
                  backgroundColor: Colors.black,
                  onPressed: () {
                    // Handle Apple login
                  },
                ),
                BuildSocialLoginButton(
                  imagePath: AppImagesPng.facebook,
                  text: local.LoginByFacebook,
                  backgroundColor: Color(0xff3a65a4),
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                BuildSocialLoginButton(
                  imagePath: AppImagesPng.google,
                  text: local.LoginByGoogle,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    // Handle Google login
                  },
                ),
                BuildSocialLoginButton(
                  imagePathSvg: AppImagesSvg.email,
                  text: local.LoginByEmail,
                  backgroundColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    // Handle Google Email
                  },
                ),
                16.verticalSpace,
                TextButton(
                  onPressed: () async {
                    await LocalStorageService.setValue(
                        LocalStorageKeys.isFirstTime, true);
                    kNavigationService.clearAndNavigateTo(AppRoutes.main);
                  },
                  child: Text(
                    local.SkipLogin,
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildTitleSplit(S local) => Container(
        padding: EdgeInsets.all(15).w,
        width: 318.w,
        child: Column(
          children: [
            Image.asset(
              AppImagesPng.icon,
            ),
            Text(
              local.TitleStartApp,
              style: AppTextStyles.h4Bold,
              textAlign: TextAlign.center,
              maxLines: local.TitleStartApp.length,
            ),
          ],
        ),
      );
}
