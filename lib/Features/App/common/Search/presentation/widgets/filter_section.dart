import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../../../../../../Core/Utils/Widget/Filters/filter_model.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../../Core/Utils/Widget/Filters/build_choice_chip.dart';
import '../../../../../../../../Core/Utils/Widget/Filters/build_title_filter_item.dart';
import '../../../../../../../../Core/Utils/Widget/Filters/price_slider.dart';
import '../manager/search_cubit.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  final FilterModel filter = FilterModel();

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppConfig.customPaddingFromRightLeft)
              .r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(local.Filter, style: AppTextStyles.h6Bold),
              TextButton(
                onPressed: () => setState(() => filter.reset()),
                child: Text(
                  local.ResetFilters,
                  style: AppTextStyles.h7Bold
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          32.verticalSpace,

          // Categories
          BuildTitleFilterItem(title: local.Categories),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: filter.categories(local).map((category) {
              return BuildChoiceChip(
                  label: category,
                  isSelected: filter.selectedCategory == category,
                  onTap: () =>
                      setState(() => filter.selectedCategory = category));
            }).toList(),
          ),

          24.verticalSpace,

          // Price Slider
          BuildTitleFilterItem(title: local.Price),
          PriceSlider(
            value: filter.price,
            min: filter.minPrice,
            max: filter.maxPrice,
            onChanged: (value) => setState(() => filter.price = value),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${filter.minPrice.toInt()}",
                  style: TextStyle(fontSize: 14)),
              Text("\$${filter.price?.toInt() ?? filter.minPrice.toInt()}",
                  style: TextStyle(fontSize: 14)),
              Text("\$${filter.maxPrice.toInt()}",
                  style: TextStyle(fontSize: 14)),
            ],
          ),

          24.verticalSpace,

          // Star Rating
          BuildTitleFilterItem(title: local.StarRating),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(5, (index) => _buildStarChip(index + 1)),
          ),

          Expanded(
            child: Align(
                child: CustomBuildButtonApp(
                    text: local.ApplyFilters,
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      context.read<SearchCubit>().searchByPrice(
                          price:
                              filter.price?.toInt() ?? filter.maxPrice.toInt());
                    })),
          ),
        ],
      ),
    );
  }

  Widget _buildStarChip(int stars) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(stars, (_) {
          return Icon(Icons.star, color: Colors.amber, size: 20);
        }),
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12).w,
      showCheckmark: false,
      selected: filter.selectedStars == stars,
      selectedColor: AppColors.backgroundColor,
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: filter.selectedStars == stars
              ? AppColors.primaryColor
              : AppColors.grayscale30,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      onSelected: (_) => setState(() => filter.selectedStars = stars),
    );
  }
}
