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

  /// `Goods with guaranteed quality`
  String get boarding1_title {
    return Intl.message(
      'Goods with guaranteed quality',
      name: 'boarding1_title',
      desc: '',
      args: [],
    );
  }

  /// `Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem.`
  String get boarding1_body {
    return Intl.message(
      'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem.',
      name: 'boarding1_body',
      desc: '',
      args: [],
    );
  }

  /// `Total warranty if the product doesn't fit`
  String get boarding2_title {
    return Intl.message(
      'Total warranty if the product doesn\'t fit',
      name: 'boarding2_title',
      desc: '',
      args: [],
    );
  }

  /// `Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem.`
  String get boarding2_body {
    return Intl.message(
      'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem.',
      name: 'boarding2_body',
      desc: '',
      args: [],
    );
  }

  /// `Let's fulfill your housing needs in logo.`
  String get boarding3_title {
    return Intl.message(
      'Let\'s fulfill your housing needs in logo.',
      name: 'boarding3_title',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry.`
  String get boarding3_body {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      name: 'boarding3_body',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Back`
  String get Back {
    return Intl.message('Back', name: 'Back', desc: '', args: []);
  }

  /// `Continue`
  String get Continue {
    return Intl.message('Continue', name: 'Continue', desc: '', args: []);
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

  /// `Search...`
  String get Search {
    return Intl.message('Search...', name: 'Search', desc: '', args: []);
  }

  /// `See All`
  String get SeeAll {
    return Intl.message('See All', name: 'SeeAll', desc: '', args: []);
  }

  /// `Popular 🔥`
  String get Popular {
    return Intl.message('Popular 🔥', name: 'Popular', desc: '', args: []);
  }

  /// `Good Morning`
  String get GoodMorning {
    return Intl.message(
      'Good Morning',
      name: 'GoodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Night`
  String get GoodNight {
    return Intl.message('Good Night', name: 'GoodNight', desc: '', args: []);
  }

  /// `Latest Products`
  String get LatestProduct {
    return Intl.message(
      'Latest Products',
      name: 'LatestProduct',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Sofa`
  String get sofa {
    return Intl.message('Sofa', name: 'sofa', desc: '', args: []);
  }

  /// `Table`
  String get table {
    return Intl.message('Table', name: 'table', desc: '', args: []);
  }

  /// `Chair`
  String get chair {
    return Intl.message('Chair', name: 'chair', desc: '', args: []);
  }

  /// `Lamp`
  String get lamp {
    return Intl.message('Lamp', name: 'lamp', desc: '', args: []);
  }

  /// `Bed`
  String get bed {
    return Intl.message('Bed', name: 'bed', desc: '', args: []);
  }

  /// `Your Card`
  String get YourCard {
    return Intl.message('Your Card', name: 'YourCard', desc: '', args: []);
  }

  /// `Security`
  String get Security {
    return Intl.message('Security', name: 'Security', desc: '', args: []);
  }

  /// `Languages`
  String get Languages {
    return Intl.message('Languages', name: 'Languages', desc: '', args: []);
  }

  /// `Help and Support`
  String get Info {
    return Intl.message('Help and Support', name: 'Info', desc: '', args: []);
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
