import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/upload_images_carpenter.dart';
import '../../../../../Core/Utils/Enums/role.dart';
import '../../../../../Core/Utils/Widget/custom_dropdown_button_form_field.dart';
import '../../../../../Core/Utils/validators/custom_validate.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../Cubit/AnimatedCrossFade/animated_cross_fade_cubit.dart';

class SingUpWithCarpenter extends StatelessWidget {
  final S local;
  final bool isRtl;
  final TextEditingController ageController;
  final TextEditingController rateHourController;
  final TextEditingController experienceYearsController;
  final TextEditingController bioController;
  final GlobalKey<FormState> formKey;
  const SingUpWithCarpenter({
    super.key,
    required this.local,
    required this.isRtl,
    required this.ageController,
    required this.rateHourController,
    required this.experienceYearsController,
    required this.bioController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdownButtonFormField<String>(
          value: context.watch<AnimatedCrossFadeCubit>().state.role.value,
          items: Role.values
              .map((e) => DropdownMenuItem(
                    value: e.value,
                    child: Text(e.value),
                  ))
              .toList(),
          onChanged: (val) =>
              context.read<AnimatedCrossFadeCubit>().changeRole(val!),
          labelText: 'Role',
        ),
        context.watch<AnimatedCrossFadeCubit>().state.role.value ==
                Role.carpenter.value
            ? Form(
                key: formKey,
                child: Column(
                  children: [
                    DefaultTextFormField(
                      text: local.age,
                      type: TextInputType.number,
                      controller: ageController,
                      inputValidator: (p0) => customValidate(
                        value: p0 ?? "",
                        titleCheck: local.age,
                      ),
                    ),
                    DefaultTextFormField(
                      text: local.years_experience,
                      type: TextInputType.number,
                      controller: experienceYearsController,
                      inputValidator: (p0) => customValidate(
                        value: p0 ?? "",
                        titleCheck: local.years_experience,
                      ),
                    ),
                    DefaultTextFormField(
                      text: local.hourly_rate,
                      type: TextInputType.number,
                      controller: rateHourController,
                      inputValidator: (p0) => customValidate(
                        value: p0 ?? "",
                        titleCheck: local.hourly_rate,
                      ),
                    ),
                    DefaultTextFormField(
                      text: local.Bio,
                      type: TextInputType.emailAddress,
                      controller: bioController,
                      maxLine: 4,
                      inputValidator: (p0) => customValidate(
                        value: p0 ?? "",
                        titleCheck: local.Bio,
                      ),
                    ),
                    UploadImagesCarpenter(
                      title: local.ProfilePhoto,
                      description: local.UploadImageCarpenter,
                      image: context
                          .watch<AnimatedCrossFadeCubit>()
                          .state
                          .imageProfile,
                      onTap: () => context
                          .read<AnimatedCrossFadeCubit>()
                          .uploadImageProfile(),
                    ),
                    UploadImagesCarpenter(
                      title: local.IDCard_Passport,
                      description: local.IDCard_PassportDescription,
                      image: context
                          .watch<AnimatedCrossFadeCubit>()
                          .state
                          .imageIDCard,
                      onTap: () => context
                          .read<AnimatedCrossFadeCubit>()
                          .uploadImageIDCard(),
                    ),
                    UploadImagesCarpenter(
                      title: local.PoliceRecord,
                      description: local.PoliceRecordDescription,
                      image: context
                          .watch<AnimatedCrossFadeCubit>()
                          .state
                          .imagePoliceRecord,
                      onTap: () => context
                          .read<AnimatedCrossFadeCubit>()
                          .uploadImagePoliceRecord(),
                    ),
                    UploadImagesCarpenter(
                      title: local.Workshop,
                      description: local.WorkshopDescription,
                      image: context
                          .watch<AnimatedCrossFadeCubit>()
                          .state
                          .imageWorkshop,
                      onTap: () => context
                          .read<AnimatedCrossFadeCubit>()
                          .uploadImageWorkshop(),
                    ),
                  ],
                ),
              )
            : SizedBox(),
        10.verticalSpace,
      ],
    );
  }
}
