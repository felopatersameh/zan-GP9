import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Config/Assets/image_svg.dart';
import '../../../Resources/app_constants.dart';
import '../Images/build_image.dart';
import '../../../../Config/Assets/image_png.dart';
import '../../../../Features/Global/Authentication/presentation/components/build_social_login_button.dart';
import '../../../Resources/app_colors.dart';
import '../../../Resources/app_fonts.dart';
import '../../../Utils/Extensions/localizations_extension.dart';

Future<T?> showCustomAnimatedDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  String? confirmButtonText,
  String? cancelButtonText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  bool barrierDismissible = true,
  Widget? customContent,
  Color? confirmButtonColor,
  Color? cancelButtonColor,
  Widget? icon,
  Color? iconColor,
}) async {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) => Container(), // Not used
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(curvedAnimation),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            backgroundColor: AppColors.backgroundColor,
            title: Column(
              children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        shape: BoxShape.circle,
                        boxShadow:barrierDismissible == true ? AppConstants.boxShadow:[]),
                    child: icon ??( barrierDismissible == true ? BuildImageAssets(
                      svg: AppImagesSvg.help,
                    ):null),
                  ),
                icon != null ? 16.verticalSpace : 0.verticalSpace,
                Text(
                  title,
                  style: AppTextStyles.h6Bold.copyWith(
                    color: AppColors.textColorBlack,
                  ),
                  maxLines: title.length,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: customContent ??
                Text(
                  content,
                  style: AppTextStyles.bodyMediumSemiBold.copyWith(
                    color: AppColors.grayscale90,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: content.length,
                ),
            actions: [
              if (cancelButtonText != null)
                CustomBuildButtonApp(
                  text: cancelButtonText,
                  isSpace: false,
                  backgroundColor: cancelButtonColor ?? AppColors.grayscale30,
                  textColor: AppColors.grayscale90,
                  elevation: 0,
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onCancel != null) onCancel();
                  },
                ),
              10.verticalSpace,
              if (confirmButtonText != null)
                CustomBuildButtonApp(
                  text: confirmButtonText,
                  isSpace: false,
                  backgroundColor: confirmButtonColor ?? AppColors.primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    if (onConfirm != null) onConfirm();
                  },
                ),
            ],
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
            ),
          ),
        ),
      );
    },
  );
}

Future<bool?> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? confirmText,
  String? cancelText,
  Widget? icon ,
  Color? iconColor,
}) {
  final local = context.local;
  return showCustomAnimatedDialog<bool>(
    context: context,
    title: title,
    content: content,
    confirmButtonText: confirmText ?? local.yes,
    cancelButtonText: cancelText ?? local.no,
    icon: icon,
    iconColor: iconColor ?? AppColors.primaryColor,
  );
}

Future<void> showSuccessDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? buttonText,
}) {
  final local = context.local;
  return showCustomAnimatedDialog(
    context: context,
    title: title,
    content: content,
    confirmButtonText: buttonText ?? local.ok,
    icon: BuildImageAssets(png: AppImagesPng.successOrderCarpenter,),
    iconColor: AppColors.success,
  );
}

Future<void> showErrorDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? buttonText,
}) {
  final local = context.local;
  return showCustomAnimatedDialog(
    context: context,
    title: title,
    content: content,
    confirmButtonText: buttonText ?? local.ok,
    icon: Icon(Icons.error_outline),
    iconColor: AppColors.error,
  );
}

Future<void> showWarningDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? buttonText,
}) {
  final local = context.local;
  return showCustomAnimatedDialog(
    context: context,
    title: title,
    content: content,
    confirmButtonText: buttonText ?? local.ok,
    icon: Icon(Icons.warning_amber_outlined),
    iconColor: AppColors.warning,
  );
}

Future<void> showLoadingDialog({
  required BuildContext context,
  String? title,
}) {
  final local = context.local;
  return showCustomAnimatedDialog(
    context: context,

    title: title ?? local.loading_dialog_title,
    content: '',
    icon: null,
    barrierDismissible: false,
    customContent: SizedBox(
      height: 100.h,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            16.verticalSpace ,
            Text(
              local.please_wait,
              style: AppTextStyles.bodyMediumSemiBold.copyWith(
                color: AppColors.grayscale90,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
