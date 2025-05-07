import 'package:flutter/material.dart';
import '../../../../../../Config/Routes/route_name.dart';
import '../../../../../../main.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Widget/Images/build_image.dart';

class ViewCardOrders extends StatelessWidget {
  const ViewCardOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => kNavigationService.navigateTo(AppRoutes.orderDetailsPage),
      child: ListTile(
        leading: BuildImageAssets(
          setDefaultImage: true,
        ),
        title: RichText(
          maxLines: 2,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Name Client",
                style: AppTextStyles.bodyMediumBold
                    .copyWith(color: AppColors.textColorBlack),
              ),
              TextSpan(
                text: '(Sevices)',
                style: AppTextStyles.bodySmallBold
                    .copyWith(color: AppColors.textColorBlack),
              ),
            ],
          ),
        ),
        subtitle: _showDateTime(context),
      ),
    );
  }

  Widget _showDateTime(BuildContext context) {
    // final watch = context.watch<CalenderOrdersDashBoardCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 2,
          "معلومات عن ال شغل و لو اليوزر كاتب ملاحظات ",
          style: AppTextStyles.bodySmallBold,
        ),
        // Text(
        //   DateFormat.MMMMd().format(watch.state.selectedDay ?? watch.now),
        // ),
      ],
    );
  }
}
