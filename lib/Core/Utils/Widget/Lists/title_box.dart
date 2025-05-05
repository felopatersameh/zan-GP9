import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Models/review_products_model.dart';
import '../../../../main.dart';
import '../../../../Config/Routes/route_name.dart';
import '../../../Resources/app_colors.dart';
import '../../../Resources/app_fonts.dart';
import '../../Extensions/localizations_extension.dart';

class BuildCustomTitleBox extends StatelessWidget {
  final String title;
  final bool isSliver;
  final List<ReviewProductsModel> list;

  const BuildCustomTitleBox({
    super.key,
    required this.title,
    this.isSliver = false, required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverToBoxAdapter(
            child: _buildBody(context),
          )
        : _buildBody(context);
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 23, bottom: 16).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.h6Bold),
          InkWell(
              onTap: () {
                kNavigationService.navigateTo(AppRoutes.seeAllPage,arguments: [
                  title,list,
                  ]);
              },
              child: Text(
                context.local.SeeAll,
                style: AppTextStyles.h7Medium.copyWith(
                  color: AppColors.primaryColor,
                ),
              )),
        ],
      ),
    );
  }
}
