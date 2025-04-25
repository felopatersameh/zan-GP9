import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../../Config/Routes/route_name.dart';
import '../../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../../Features/App/Service/Carpenter/data/Models/carpenters_model.dart';
import '../../../../../../../main.dart';

class BuildProfileAvatar extends StatelessWidget {
  const BuildProfileAvatar({
    super.key,
    required this.model,
  });

  final CarpentersModel model;

  @override
  Widget build(BuildContext context) {
    final isAvailable = model.isAvailable == 1;
    final isVerified = model.isVerified == 1;
    return GestureDetector(
      onTap: () {
        kNavigationService.navigateTo(AppRoutes.imageView,arguments: model.user!.photoUrl);
      },
      child: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundColor: AppColors.backgroundColor,
              child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: isAvailable ? AppColors.success : AppColors.error,
                        width: 3),
                  ),
                  child: BuildImageAssets(
                    url: model.user!.photoUrl,
                    setDefaultImage: true,
                  )),
            ),
            isVerified
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: FaIcon(
                      FontAwesomeIcons.certificate,
                      color: AppColors.success,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
