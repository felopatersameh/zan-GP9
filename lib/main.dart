import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:zan/Config/Themes/light.dart';
import 'Config/Cubit/settings_cubit.dart';
import 'Config/Routes/Navigation/navigation_service.dart';
import 'Config/Routes/route_name.dart';
import 'Config/Routes/route_generator.dart';
import 'Config/Themes/dark_theme.dart';
import 'Config/app_config.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
final AppNavigationService kNavigationService = AppNavigationService();

Future<void> main() async {
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://3af3a95877cbfcc6f2d362c3e9922af3@o4508230445236224.ingest.de.sentry.io/4508770274181200';
    },
    appRunner: () => runApp(
      SentryWidget(
        child: MyApp(),
      ),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        enableScaleWH: () => false,
        enableScaleText: () => true,
        builder: (_, child) {
          ScreenUtil.init(context);
          return BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppConfig.appName,
                locale: state.locale,
                themeMode: state.themeMode,
                theme: lightThemes(),
                darkTheme: darkThemes(),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: AppRouteNames.splash,
                navigatorKey: kNavigationService.navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
