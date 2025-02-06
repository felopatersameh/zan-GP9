// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find the best parts for your home`
  String get TitleLogoSplash {
    return Intl.message(
      'Find the best parts for your home',
      name: 'TitleLogoSplash',
      desc: '',
      args: [],
    );
  }

  /// `Find your perfect furniture for your sweet hom`
  String get TitleStartApp {
    return Intl.message(
      'Find your perfect furniture for your sweet hom',
      name: 'TitleStartApp',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get LoginByApple {
    return Intl.message(
      'Continue with Apple',
      name: 'LoginByApple',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get LoginByGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'LoginByGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get LoginByFacebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'LoginByFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with email`
  String get LoginByEmail {
    return Intl.message(
      'Continue with email',
      name: 'LoginByEmail',
      desc: '',
      args: [],
    );
  }

  /// `Maybe Later`
  String get SkipLogin {
    return Intl.message('Maybe Later', name: 'SkipLogin', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Explore`
  String get Explore {
    return Intl.message('Explore', name: 'Explore', desc: '', args: []);
  }

  /// `Scan`
  String get Scan {
    return Intl.message('Scan', name: 'Scan', desc: '', args: []);
  }

  /// `Cart`
  String get Cart {
    return Intl.message('Cart', name: 'Cart', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `Favourite`
  String get Favourite {
    return Intl.message('Favourite', name: 'Favourite', desc: '', args: []);
  }

  /// `Search`
  String get Search {
    return Intl.message('Search', name: 'Search', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
