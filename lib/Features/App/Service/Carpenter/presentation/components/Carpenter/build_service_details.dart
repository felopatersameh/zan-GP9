import 'package:flutter/material.dart';
import '../../../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../../Core/Resources/app_icons.dart';
import '../../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../../Features/App/Service/Carpenter/data/Models/carpenters_model.dart';
import '../../../../../../../../generated/l10n.dart';

class BuildServiceDetails extends StatelessWidget {
  final S local;
  final CarpentersModel model;
  const BuildServiceDetails({
    super.key,
    required this.local,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
        final local = context.local;
    final isVerified = model.isVerified == 1;
    final idCardPhotoUrl = model.idCardPhotoUrl.isNotEmpty;
    final policeRecordPhotoUrl = model.policeRecordPhotoUrl.isNotEmpty;
    final workshopPhotoUrl = model.workshopPhotoUrl.isNotEmpty;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE6F3FF),
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: Column(
        children: [
          items(title: local.age, text: model.age.toString()),
          _buildDivider(),
          items(
              title: local.id_card_photo_url,
              trailing: isVerified
                  ? AppIcons.check
                  : idCardPhotoUrl
                      ? AppIcons.check
                      : AppIcons.uncheck),
          _buildDivider(),
          items(
              title: local.police_record_photo_url,
              trailing: isVerified
                  ? AppIcons.check
                  : policeRecordPhotoUrl
                      ? AppIcons.check
                      : AppIcons.uncheck),
          _buildDivider(),
          items(
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

  ListTile items(
    {required String title,
    Widget? trailing,
    String? text,
  }) {
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
}
