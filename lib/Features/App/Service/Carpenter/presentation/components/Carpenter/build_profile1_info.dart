import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../Features/App/Service/Carpenter/data/Models/carpenters_model.dart';

class BuildProfile1Inf extends StatelessWidget {
  const BuildProfile1Inf({
    super.key,
    required this.model,
  });

  final CarpentersModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(model.user!.name, style: AppTextStyles.h4Bold),
        10.horizontalSpace,
        Row(
          children: [
            Text(model.averageRating, style: AppTextStyles.h4Bold),
            Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
