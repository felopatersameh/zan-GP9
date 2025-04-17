import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../app_config.dart';
import '../../Core/Storage/Local/local_storage_keys.dart';
import '../../Core/Storage/Local/local_storage_service.dart';

class SettingsCubit extends Cubit<SettingsState> with WidgetsBindingObserver {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _subscription;

  SettingsCubit() : super(SettingsState(locale: AppConfig.languageMain)) {
    WidgetsBinding.instance.addObserver(this);
    _monitorConnection();
    _updateLanguage();
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    return super.close();
  }

  @override
  void didChangePlatformBrightness() {
    _updateThemeMode();
  }

  Future<void> startAnimations() async {
    emit(state.copyWith(logoOpacity: 1.0));
  }
  Future<void> endAnimations() async {
    emit(state.copyWith(loadingOpacity: 1.0));
  }

  void _updateThemeMode() {}

  void _updateLanguage() async {
    final localeString = await LocalStorageService.getValue(
      LocalStorageKeys.selectedLanguage,
      defaultValue: false,
    );

    if (localeString != false) {
      emit(state.copyWith(locale: Locale(localeString)));
    }
  }

  void toggleTheme() {
    emit(state.copyWith(
      themeMode:
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    ));
  }

  void changeLanguage(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  void _monitorConnection() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result.isEmpty || result.contains(ConnectivityResult.none)) {
        emit(state.copyWith(internet: false));
      } else {
        emit(state.copyWith(internet: true));
      }
    });
  }

  bool getConnectivity() => state.internet;
}

@immutable
class SettingsState {
  final ThemeMode themeMode;
  final Locale locale;
  final bool internet;
  final bool loading;
  final double logoOpacity;

  final double textOpacity;

  final double loadingOpacity;

  const SettingsState(
      {this.themeMode = ThemeMode.light,
      required this.locale,
      this.internet = false,
      this.loading = true,
      this.loadingOpacity = 0.0,
      this.logoOpacity = 0.0,
      this.textOpacity = 0.0});

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    bool? internet,
    bool? loading,
     double? logoOpacity,

    double? textOpacity,

     double ?loadingOpacity,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      internet: internet ?? this.internet,
      loading: loading ?? this.loading,
      logoOpacity: logoOpacity ?? this.logoOpacity,
      textOpacity: textOpacity ?? this.textOpacity,
      loadingOpacity: loadingOpacity ?? this.loadingOpacity,
    );
  }
}
