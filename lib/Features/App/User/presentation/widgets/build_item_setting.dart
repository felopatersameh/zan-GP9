import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Resources/app_fonts.dart';


class BuildItemSetting extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function()? onTap;

  const BuildItemSetting({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          title: Text(
            title,
            style: AppTextStyles.h6SemiBold,
          ),
          leading: icon,
        ),
        5.verticalSpace,
        Divider(
          indent: 35.w,
        )
      ],
    );
  }
}
