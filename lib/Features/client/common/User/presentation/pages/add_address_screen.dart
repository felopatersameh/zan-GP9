import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Services/Map/Static/location_service.dart';
import '../Cubit/user_cubit.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../Core/Utils/Widget/TextField/build_text_field.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

final formKey = GlobalKey<FormState>();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController areaController = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController stateController = TextEditingController();
final TextEditingController postalCodeController = TextEditingController();

class _AddAddressScreenState extends State<AddAddressScreen> {

  @override
  void initState() {
    final address = context.read<UserCubit>().state.place!.first;
    final user = context.read<UserCubit>().state.userDataModel;
    nameController.text = user.name;
    phoneController.text = user.phone;
    final addressLine = (address.thoroughfare?.isNotEmpty == true)
        ? address.thoroughfare!
        : (address.street?.isNotEmpty == true && !address.street!.contains('+'))
        ? address.street!
        : '${address.locality ?? ''}, ${address.subAdministrativeArea ?? ''}';

    addressController.text = addressLine;
    areaController.text = address.subAdministrativeArea ?? '';
    cityController.text = address.locality ?? '';
    stateController.text = address.administrativeArea ?? '';
    postalCodeController.text = address.postalCode ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return [
      SliverList.list(children: [
        Form(
          child: Column(
            children: [
              DefaultTextFormField(
                text: local.name,
                type: TextInputType.name,
                isTextOut: false,
                isTextIn: false,
                controller: nameController,
              ),
              DefaultTextFormField(
                text: local.phone,
                type: TextInputType.phone,
                isTextOut: false,
                isTextIn: false,
                controller: phoneController,
              ),
              DefaultTextFormField(
                enable: false,
                text: local.address_line,
                type: TextInputType.streetAddress,
                isTextOut: false,
                isTextIn: false,
                controller: addressController,
              ),
              DefaultTextFormField(
                enable: false,
                text: local.area,
                type: TextInputType.streetAddress,
                isTextOut: false,
                isTextIn: false,
                controller: areaController,
              ),
              DefaultTextFormField(
                enable: false,
                text: local.city,
                type: TextInputType.streetAddress,
                isTextOut: false,
                isTextIn: false,
                controller: cityController,
              ),
              DefaultTextFormField(
                enable: false,
                text: local.state,
                type: TextInputType.streetAddress,
                isTextOut: false,
                isTextIn: false,
                controller: stateController,
              ),
              DefaultTextFormField(
                enable: false,
                text: local.postal_code,
                type: TextInputType.streetAddress,
                isTextOut: false,
                isTextIn: false,
                controller: postalCodeController,
              ),
              30.verticalSpace,
              BuildSocialLoginButton(
                text: local.Save,
                onPressed: () {
                  // final address = AddressModel.input(
                  //   nameController.text,
                  //   phoneController.text,
                  //   addressController.text,
                  //   areaController.text,
                  //   cityController.text,
                  //   stateController.text,
                  //   postalCodeController.text,
                  //   false,
                  // );

                  // context.read<UserCubit>().addAddress(address);
                  LocationService loca = LocationService() ;
                  loca.getDetailsAddressByLatLong(isMyLocation: true) ;
                },
                isSpace: false,
                loading: false,
                backgroundColor: AppColors.primaryColor,
              )
            ],
          ),
        )
      ])
    ].styledAppPages(
        withAll: true,
        appbar: true,
        widgetAppbar: AppBar(
          centerTitle: true,
          title: Text(
            local.AddAddress,
          ),
        ));
  }
}
