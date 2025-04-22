import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';

class BuildButtonCarpenterService extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool? loading;
  const BuildButtonCarpenterService({
    super.key,
    required this.onPressed,
    required this.text,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: true,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: CustomBuildButtonApp(
            loading: loading ?? false,
            size: Size(295.w, 56.w),
            text: text,
            backgroundColor: AppColors.primaryColor,
            onPressed: onPressed,
            isSpace: false,
          ),
        ),
      ),
    );
  }
}
