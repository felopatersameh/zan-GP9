import 'package:flutter/material.dart';
import '../../../Features/App/User/presentation/widgets/language_selector.dart';
import '../Extensions/context_extension.dart';

class ShowBottomSheetMethods {
  static void showLanguage(BuildContext context) =>
      context.buildCustomBottomSheet(widget: LanguageList());
  static void showFilter(BuildContext context) =>
      context.buildCustomBottomSheet(widget: LanguageList());
}
