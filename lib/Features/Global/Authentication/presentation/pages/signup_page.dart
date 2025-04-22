import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sing_up_with_carpenter.dart';
import '../../../../../Core/Utils/Enums/role.dart';
import '../../data/Models/register_model.dart';
import '../Cubit/AnimatedCrossFade/animated_cross_fade_cubit.dart';
import '../../../../../Core/Utils/validators/custom_validate.dart';
import '../../../../../Core/Utils/validators/email_validate.dart';
import '../../../../../Core/Utils/validators/phone_validate.dart';
import '../../../../../Core/Resources/app_colors.dart';
import '../../../../../Core/Resources/app_constants.dart';
import '../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../../Core/Utils/Widget/TextField/password_text__form_field.dart';
import '../Cubit/authentication_cubit.dart';
import '../components/build_social_login_button.dart';
import '../components/two_text_buttons_switch.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final formKey = GlobalKey<FormState>();
final formKeyCarpenter = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController rateHourController = TextEditingController();
final TextEditingController experienceYearsController = TextEditingController();
final TextEditingController bioController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    nameController.clear();
    ageController.clear();
    rateHourController.clear();
    experienceYearsController.clear();
    bioController.clear();
    formKeyCarpenter.currentState?.reset();
    formKey.currentState?.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    final isRtl = context.isRtl;
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) => Align(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextFormField(
                  text: local.name,
                  type: TextInputType.name,
                  controller: nameController,
                  inputValidator: (p0) =>
                      customValidate(value: p0 ?? "", isRtl: isRtl),
                ),
                DefaultTextFormField(
                  text: local.email,
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  inputValidator: (p0) =>
                      validateEmail(email: p0 ?? "", isRtl: isRtl),
                ),
                DefaultTextFormField(
                  text: local.phone,
                  type: TextInputType.phone,
                  controller: phoneController,
                  inputValidator: (p0) => validatePhone(p0 ?? "", isRtl: isRtl),
                ),
                CustomPasswordTextFromField(
                  showForgetMessage: false,
                  hintText: local.password,
                  fieldId: AppConstants.passwordSignup,
                  controller: passwordController,
                ),
                SingUpWithCarpenter(
                  local: local,
                  isRtl: isRtl,
                  ageController: ageController,
                  rateHourController: rateHourController,
                  experienceYearsController: experienceYearsController,
                  bioController: bioController,
                  formKey: formKeyCarpenter,
                ),
                CustomBuildButtonApp(
                    loading: state is AuthenticationCreateAccountLoading,
                    text: local.SignUp,
                    backgroundColor: AppColors.secondaryColor,
                    textColor: AppColors.textColorWhite,
                    isSpace: false,
                    onPressed: () {
                      final bool isCarpenter =
                          context.read<AnimatedCrossFadeCubit>().state.role ==
                              Role.carpenter;
                      if (isCarpenter) {
                        if (formKeyCarpenter.currentState?.validate() == true) {
                          return;
                        }
                      } else {
                        if (formKey.currentState?.validate() == true) {
                          {
                            final RegisterModel register = RegisterModel(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              passwordConfirmation: passwordController.text,
                            );
                            context.read<AuthenticationCubit>().createAccount(
                                register,
                                local.messageRegisterSuccess,
                                context);
                          }
                        }
                      }
                    }),
                TwoTextButtonsSwitch(
                  firstText: local.orLogin,
                  secondText: local.Login,
                ),
              ],
            )),
      ),
      listener: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationCreateAccountSuccess) {
          context.read<AnimatedCrossFadeCubit>().tapChange();
        }
      },
    );
  }
}
