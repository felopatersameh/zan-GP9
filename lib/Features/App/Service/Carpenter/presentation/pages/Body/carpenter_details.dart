import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zan/Core/Utils/Widget/Animations/build_animatedview_list_box.dart';
import '../../../../../../../Core/Utils/Widget/Images/image_gallery_viewer.dart';
import '../../../data/Models/carpenters_model.dart';
import '../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../Core/Resources/app_icons.dart';
import '../../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../../generated/l10n.dart';
import '../../Cubit/CarpenterService/carpenter_service_cubit.dart';
import '../../components/build_button_carpenter_service.dart';
import 'confirmation_order.dart';

class CarpenterDetails extends StatelessWidget {
  final CarpentersModel model;

  const CarpenterDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
  
    final local = context.local;
    final isAvailable = model.isAvailable == 1;
    final isVerified = model.isVerified == 1;
    final idCardPhotoUrl = model.idCardPhotoUrl.isNotEmpty;
    final policeRecordPhotoUrl = model.policeRecordPhotoUrl.isNotEmpty;
    final workshopPhotoUrl = model.workshopPhotoUrl.isNotEmpty;
    List<Widget> children = 
      [
          20.verticalSpace,
          _buildProfileAvatar(isVerified, isAvailable),
          _buildProfile1Info(),
          25.verticalSpace,
          _buildProfileInfo(local),
          30.verticalSpace,
          _buildBioSection(),
          30.verticalSpace,
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageGalleryViewer(imageUrls: [model.idCardPhotoUrl,model.policeRecordPhotoUrl,model.workshopPhotoUrl])));
            },
            child: _buildServiceDetails(local, isVerified, idCardPhotoUrl,
                policeRecordPhotoUrl, workshopPhotoUrl),
          ),
        ];
    return [
      SliverList.list(
        children: [...List.generate(children.length, (index) => BuildAnimatedviewListBox(index: index, child: children[index]))]
      ),
      !context.isProfileCarpenter(model) ? BuildButtonCarpenterService(
        onPressed: () {
          context.read<CarpenterServiceCubit>().choseCarpenter(model);
          context.read<CarpenterServiceCubit>().changeScreen(OrderDetailsBody());
        },
        text: local.Confirm,
      ):SliverToBoxAdapter(child: SizedBox()),
    ].styledAppPages(withScroll: true, withPadding: true);
  }

  Widget _buildProfileAvatar(bool isVerified, bool isAvailable) {
    return Center(
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
    );
  }

  Widget _buildProfile1Info() {
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

  Widget _buildBioSection() {
    return Text(model.bio, style: AppTextStyles.bodyLargeSemiBold);
  }

  Widget _buildServiceDetails(S local, bool isVerified, bool idCardPhotoUrl,
      bool policeRecordPhotoUrl, bool workshopPhotoUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE6F3FF),
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: Column(
        children: [
          // _buildServiceDetailItem(title:local.name ,text:model.user!.name),
          // _buildDivider(),
          _buildServiceDetailItem(title: local.age, text: model.age.toString()),
          _buildDivider(),
          // _buildServiceDetailItem(title:local.hourly_rate, text:model.hourlyRate),
          // _buildDivider(),
          // _buildServiceDetailItem(title:local.hourly_rate, text:("e.hourlyRate.split('').first")),
          // _buildDivider(),
          _buildServiceDetailItem(
              title: local.id_card_photo_url,
              trailing: isVerified
                  ? AppIcons.check
                  : idCardPhotoUrl
                      ? AppIcons.check
                      : AppIcons.uncheck),
          _buildDivider(),
          _buildServiceDetailItem(
              title: local.police_record_photo_url,
              trailing: isVerified
                  ? AppIcons.check
                  : policeRecordPhotoUrl
                      ? AppIcons.check
                      : AppIcons.uncheck),
          _buildDivider(),
          _buildServiceDetailItem(
              title: local.workshop_photo_url,
              trailing: isVerified
                  ? AppIcons.check
                  : workshopPhotoUrl
                      ? AppIcons.check
                      : AppIcons.uncheck),
        ],
      ),
    );
  }

  // Widget _buildReviewCard(ReviewCarpentersModel review) {
  //   return Column(
  //     children: [
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           CircleAvatar(
  //             backgroundColor: Colors.transparent,
  //             radius: 24,
  //             child: BuildImageAssets(
  //               url:  "default.jpg",
  //               setDefaultImage: true,
  //             ),
  //           ),
  //           10.horizontalSpace,
  //           // Review Details
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   review.user?.name?? "",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //                 SizedBox(height: 4),
  //
  //                 // Star Rating
  //                 Row(
  //                   children: List.generate(
  //                     review.rating,
  //                         (index) =>
  //                         Icon(Icons.star, color: Colors.orange, size: 18),
  //                   ),
  //                 ),
  //                 SizedBox(height: 4),
  //
  //
  //                 // Review Text
  //                 Text(
  //                   (review.comment ?? ""),
  //                   style: TextStyle(fontSize: 14, color: Colors.black87),
  //                 ),
  //                 SizedBox(height: 4),
  //
  //                 // Review Date
  //                 Text(
  //                   "Review by Krist | Posted on ${review.createdAt}",
  //                   style: TextStyle(fontSize: 12, color: Colors.grey),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //       Divider(),
  //     ],
  //   );
  // }

  Widget _buildServiceDetailItem(
      {required String title, Widget? trailing, String? text}) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.bodyLargeSemiBold,
      ),
      trailing: trailing ??
          Text(
            text ?? "",
            style: AppTextStyles.bodyLargeSemiBold,
            maxLines: text?.length,
          ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.backgroundColor,
      indent: 15,
      endIndent: 15,
      thickness: 2,
    );
  }

  Widget _buildProfileInfo(S local) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoItem(model.completedServices.toString(),
            local.completed_services, Colors.blue),
        _buildInfoItem(model.hourlyRate, local.hourly_rate, Colors.orange),
        _buildInfoItem(model.yearsExperience.toString(), local.years_experience,
            Colors.green),
      ],
    );
  }

  Widget _buildInfoItem(String value, String title, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
