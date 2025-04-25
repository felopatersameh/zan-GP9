import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/generated/l10n.dart';

class AppConfig {
  static const String appName = 'Zan';
  static const ScrollPhysics physicsCustomScrollView =
      RangeMaintainingScrollPhysics();
  static double customPaddingFromRightLeft = 24;
  static double customPaddingFromTopBottom = 16;
  static EdgeInsets customPadding = EdgeInsets.only(
    right: customPaddingFromRightLeft,
    left: customPaddingFromRightLeft,
    top: customPaddingFromTopBottom,
  ).r;

  static const Map<String, String> languageNames = {
    'ar': 'العربية',
    'en': 'English',
  };

  static   Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ];
  static final List<String> languageKeys = languageNames.keys.toList();
  static final Locale languageMain = Locale(languageKeys.first);
}
