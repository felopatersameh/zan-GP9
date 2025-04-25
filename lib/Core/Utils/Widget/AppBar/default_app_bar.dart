import 'package:flutter/material.dart';

import '../../../Resources/app_fonts.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {

  const DefaultAppBar({
    super.key,
    required this.local, this.action,
  });

  final String local;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        local,
        style: AppTextStyles.h6Bold,
      ),
      centerTitle: true,
      actions:action,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
