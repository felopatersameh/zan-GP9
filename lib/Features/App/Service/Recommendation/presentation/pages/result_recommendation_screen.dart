import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';

import '../../../../../../Core/Models/review_products_model.dart';
import '../../../../../../Core/Utils/Widget/AppBar/default_app_bar.dart';
import '../../../../../../Core/Utils/Widget/Lists/custom_sliver_grid_builder.dart';

class ResultRecommendationScreen extends StatelessWidget {
  final String photo;
  final List<ReviewProductsModel> list;
  const ResultRecommendationScreen(
      {super.key, required this.photo, required this.list});

  @override
  Widget build(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: BuildImageAssets(
          file: photo,
          height: 300.h,
          width: 1.sw,
          fit: BoxFit.contain,
        ),
      ),
      SliverPadding(
        padding: AppConfig.customPadding,
        sliver: BuildCustomGridBuilder(
          showAllItems: true,
          model: list,
          loading: list.isEmpty,
        ),
      ),
    ].styledAppPages(
      withAll: true,
      appbar: true,
      widgetAppbar:
          DefaultAppBar(local: context.local.FurnitureRecommendationFeature),
    );
  }
}
