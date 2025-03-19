import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Features/Global/Authentication/presentation/Cubit/AnimatedCrossFade/animated_cross_fade_cubit.dart';
import '../../../Resources/app_fonts.dart';
import '../../Extensions/localizations_extension.dart';

import '../../../Resources/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final String text;
  final TextInputType type;
  final Widget? suffixIcon;
  final bool? isPassword;
  final bool? isLogin;
  final TextEditingController? controller;
  final Function()? pressSuffix;
  final String? Function(String?)? inputValidator;
  final ValueChanged<String>? submitted;
  final void Function()? onTap;
  final int? maxLine;

  const DefaultTextFormField({
    super.key,
    required this.text,
    required this.type,
    this.suffixIcon,
    this.inputValidator,
    this.submitted,
    this.isPassword,
    this.pressSuffix,
    this.controller,
    this.onTap,
    this.maxLine,
    this.isLogin = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 294.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyles.bodyMediumBold,
          ),
          10.verticalSpace,
          TextFormField(
            autofocus: true,
            onTapAlwaysCalled: true,
            maxLines: maxLine ?? 1,
            onTap: onTap,
            style: AppTextStyles.bodyMediumBold
                .copyWith(color: AppColors.grayscale70),
            onFieldSubmitted: submitted,
            controller: controller,
            keyboardType: type,
            obscureText: isPassword ?? false,
            validator: inputValidator,
            decoration: InputDecoration(
              hintText: "${context.local.Enter} $text",
              hintStyle: AppTextStyles.bodyMediumBold
                  .copyWith(color: AppColors.grayscale70),
              fillColor: AppColors.backgroundColor,
              filled: true,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.grayscale50)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isLogin == true
                  ? TextButton(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        context
                            .read<AnimatedCrossFadeCubit>()
                            .viewForgetPasswordPage();
                      },
                      child: Text(
                        context.local.forgetPassword,
                        style: AppTextStyles.bodyXtraSmallSemiBold
                            .copyWith(color: AppColors.primaryColor),
                      ))
                  : SizedBox()
            ],
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
