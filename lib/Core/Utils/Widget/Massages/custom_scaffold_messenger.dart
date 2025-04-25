import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../Config/Cubit/translator_model.dart';

enum SnackBarType { success, error, info }

Future<void> showCustomSnackBar(BuildContext context,
    String text,
    SnackBarType type, {
      double iconPositionTop = 30,
      bool trans = true,
    }) async {
  CustomSnackBar customSnackBar;
  String message = text;
final masLine= message.isEmpty ? 1 : message.length;

  if (trans) {
    message = await (text).translateText(context);
  }

  switch (type) {
    case SnackBarType.success:
      customSnackBar = CustomSnackBar.success(
        iconPositionTop: iconPositionTop,
        maxLines:masLine,
        message: message,
      );
      break;
    case SnackBarType.error:
      customSnackBar = CustomSnackBar.error(
        message: message,
        maxLines: masLine,
        iconPositionTop: iconPositionTop,
      );
      break;
    case SnackBarType.info:
      customSnackBar = CustomSnackBar.info(
        message: message,
        maxLines: masLine,
        iconPositionTop: iconPositionTop,
      );
      break;
  }

  showTopSnackBar(Overlay.of(context), customSnackBar);
}
