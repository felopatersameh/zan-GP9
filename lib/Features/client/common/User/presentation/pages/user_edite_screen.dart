import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Resources/app_icons.dart';
import '../../data/models/add_address_model.dart';
import '../Cubit/user_cubit.dart';
import '../../../../../../main.dart';
import '../../../../../../Config/Routes/route_name.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';

import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../data/models/update_user.dart';

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
                BuildSocialLoginButton(
                  loading: state.loading,
                  isSpace: false,
                  text: local.Save,
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final UpdateUser updateUser = UpdateUser(
                        nameController.text,
                        emailController.text,
                        phoneController.text,
                        state.userDataModel.photoUrl.toString(),
                      );
                      context.read<UserCubit>().updateUser(context, updateUser);
                    }
                  },
                ),
                20.verticalSpace,
                ...(state.address ?? []).map((address) {
                  return AddressContainer(
                    address: address.address!,
                    model: address,
                    isDefault: address.isDefault!,
                  );
                }),
                10.verticalSpace,
                BuildSocialLoginButton(
                    isSpace: false,
                    text: local.AddAddress,
                    backgroundColor: AppColors.grayscale70,
                    onPressed: () {
                      kNavigationService.navigateTo(AppRoutes.selectLocation);
                    }),
                10.verticalSpace,
                BuildSocialLoginButton(
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

class AddressContainer extends StatelessWidget {
  final String address;
  final AddressModel model;
  final bool isDefault;

  const AddressContainer({
    super.key,
    required this.address,
    this.isDefault = false,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserCubit>().setDefaultAddress(model);
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                address,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            if (isDefault) AppIcons.check,
            if (!isDefault)
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.primaryColorDark),
                    shape: BoxShape.circle),
              )
          ],
        ),
      ),
    );
  }
}
