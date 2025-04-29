import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../../Config/Routes/route_name.dart';
import '../../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';
import '../../../../../../../../Features/App/Service/Carpenter/data/Models/carpenters_model.dart';
import 'build_profile1_info.dart';
import '../../../../../../../../Features/App/Service/Carpenter/presentation/components/Carpenter/build_profile_avatar.dart';
import '../../../../../../../../Features/App/Service/Carpenter/presentation/components/Carpenter/build_profile_info.dart';
import '../../../../../../../../Features/App/Service/Carpenter/presentation/components/Carpenter/build_service_details.dart';
import '../../../../../../../../main.dart';

class ViewAllCarpenterInformationScreen extends StatelessWidget {
  const ViewAllCarpenterInformationScreen({
    super.key,
    required this.model,
  });

  final CarpentersModel model;


  @override
  Widget build(BuildContext context) {
    final local = context.local;
    List<Widget> children = [
      20.verticalSpace,
      BuildProfileAvatar(model: model),
      BuildProfile1Inf(model: model),
      25.verticalSpace,
      BuildProfileInfo(model: model, local: local),
      30.verticalSpace,
      _buildBioSection(),
      30.verticalSpace,
      GestureDetector(
        onTap: () {
          kNavigationService.navigateTo(AppRoutes.imageViewer, arguments: [
            model.idCardPhotoUrl,
            model.policeRecordPhotoUrl,
            model.workshopPhotoUrl
          ]);
        },
        child: BuildServiceDetails(local: local, model: model),
      ),
    ];
    return SliverList.list(children: [
      ...List.generate(
          children.length,
          (index) =>
              BuildAnimatedviewListBox(index: index, child: children[index]))
    ]);
  }

  Widget _buildBioSection() {
    return Text(model.bio, style: AppTextStyles.bodyLargeSemiBold);
  }
}
