import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Utils/Widget/Dialogs/dialog_examples.dart';
import '../Cubit/user_cubit.dart';
import '../../../../../main.dart';
import '../../../../../Config/Routes/route_name.dart';
import '../../../../../Core/Resources/app_colors.dart';
import '../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../Global/Authentication/presentation/components/build_social_login_button.dart';

import '../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../data/models/update_user.dart';
import '../widgets/address_container.dart';

class UserEditeScreen extends StatefulWidget {
  const UserEditeScreen({super.key});

  @override
  State<UserEditeScreen> createState() => _UserEditeScreenState();
}

final formKey = GlobalKey<FormState>();
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController addressController = TextEditingController();

class _UserEditeScreenState extends State<UserEditeScreen> {
  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return BlocBuilder<UserCubit, UserClassState>(
      builder: (context, state) {
        nameController.text = state.userDataModel.name;
        emailController.text = state.userDataModel.email;
        phoneController.text = state.userDataModel.phone;
        return [
          SliverList.list(children: [
            Form(
              key: formKey,
              child: Column(children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 75.r,
                  child: BuildImageAssets(
                    url: state.userDataModel.photoUrl.toString(),
                    setDefaultImage: true,
                  ),
                ),
                DefaultTextFormField(
                  text: local.name,
                  type: TextInputType.name,
                  isTextOut: false,
                  isTextIn: false,
                  controller: nameController,
                ),
                DefaultTextFormField(
                  text: local.email,
                  type: TextInputType.name,
                  isTextOut: false,
                  isTextIn: false,
                  controller: emailController,
                ),
                DefaultTextFormField(
                  text: local.phone,
                  type: TextInputType.name,
                  isTextOut: false,
                  isTextIn: false,
                  controller: phoneController,
                ),
                CustomBuildButtonApp(
                  loading: state.loading,
                  isSpace: false,
                  text: local.Save,
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final UpdateUser updateUser = UpdateUser(
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                        state.userDataModel.photoUrl.toString(),
                      );
                      if (updateUser.name != state.userDataModel.name ||
                          updateUser.email != state.userDataModel.email ||
                          updateUser.phone != state.userDataModel.phone) {
                        await DialogExamples.showSaveUserInfoConfirmationDialog(
                            context,
                            onConfirm: () async => await context
                                .read<UserCubit>()
                                .updateUser(context, updateUser));
                      } else {
                        return;
                      }
                    }
                  },
                ),
                20.verticalSpace,
                ...(state.address ?? []).map((address) {
                  return AddressContainer(
                    address: address.address ?? "",
                    model: address,
                    isDefault: address.isDefault ?? false,
                  );
                }),
                10.verticalSpace,
                CustomBuildButtonApp(
                    isSpace: false,
                    text: local.AddAddress,
                    backgroundColor: AppColors.grayscale70,
                    onPressed: () {
                      kNavigationService.navigateTo(AppRoutes.selectLocation);
                    }),
                10.verticalSpace,
                CustomBuildButtonApp(
                  isSpace: false,
                  text: local.ChangePassword,
                  backgroundColor: AppColors.grayscale70,
                  onPressed: () {
                    kNavigationService
                        .navigateTo(AppRoutes.changePasswordScreen);
                  },
                )
              ]),
            )
          ])
        ].styledAppPages(
          withAll: true,
          appbar: true,
          widgetAppbar: AppBar(
            title: Text(local.Profile),
            centerTitle: true,
          ),
        );
      },
    );
  }
}
