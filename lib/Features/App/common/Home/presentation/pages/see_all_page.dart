import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';

import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Models/review_products_model.dart';
import '../../../../../../Core/Utils/Widget/AppBar/default_app_bar.dart';
import '../../../../../../Core/Utils/Widget/Lists/custom_sliver_grid_builder.dart';

class SeeAllPage extends StatelessWidget {
  final List<ReviewProductsModel>? list;
  final String title;
  const SeeAllPage({super.key, required this.list, required this.title});

  @override
  Widget build(BuildContext context) {
    return [
      SliverPadding(
        padding: AppConfig.customPadding,
        sliver: BuildCustomGridBuilder(
          showAllItems: true,
          model: list,
          loading: list?.isEmpty,
        ),
      ),
    ].styledAppPages(
      withAll: true,
      appbar: true,
      widgetAppbar: DefaultAppBar(local: title),
    );
  }
}
