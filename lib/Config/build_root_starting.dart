import 'package:flutter/material.dart';
import 'package:zan/Config/Cubit/settings_cubit.dart';
import 'package:zan/Config/Routes/route_generator.dart';
import 'package:zan/Config/Routes/route_name.dart';
import 'package:zan/Config/Themes/dark_theme.dart';
import 'package:zan/Config/Themes/light.dart';
import 'package:zan/Config/app_config.dart';
import 'package:zan/generated/l10n.dart';

class BuildRootStarting extends StatelessWidget {
  const BuildRootStarting({
    super.key,
    required this.state,
    required this.navigatorKey,
  });
  final SettingsState state;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      locale: state.locale,
      themeMode: state.themeMode,
      theme: lightThemes(),
      darkTheme: darkThemes(),
      localizationsDelegates: AppConfig.localizationsDelegates,
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: AppRoutes.splash,
      navigatorKey: navigatorKey,
    );
  }
}
