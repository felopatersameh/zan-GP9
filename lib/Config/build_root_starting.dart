import 'package:flutter/material.dart';
import 'Cubit/settings_cubit.dart';
import 'Routes/route_generator.dart';
import 'Routes/route_name.dart';
import 'Themes/dark_theme.dart';
import 'Themes/light.dart';
import 'app_config.dart';
import '../generated/l10n.dart';

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
