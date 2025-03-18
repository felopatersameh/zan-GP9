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

  /// `Sempre in curses magna et eu various nuns adipiscing. Elementum justo, laoreet id sem.`
  String get boarding1_body {
    return Intl.message(
      'Sempre in curses magna et eu various nuns adipiscing. Elementum justo, laoreet id sem.',
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

  /// `Sempre in curses magna et eu various nuns adipiscing. Elementum justo, laoreet id sem.`
  String get boarding2_body {
    return Intl.message(
      'Sempre in curses magna et eu various nuns adipiscing. Elementum justo, laoreet id sem.',
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

  /// `Find your perfect furniture for your sweet home`
  String get TitleStartApp {
    return Intl.message(
      'Find your perfect furniture for your sweet home',
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

  /// `Email`
  String get LoginByEmail {
    return Intl.message('Email', name: 'LoginByEmail', desc: '', args: []);
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message('Sign Up', name: 'SignUp', desc: '', args: []);
  }

  /// `Forget Password ?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// ` Enter Your`
  String get Enter {
    return Intl.message(' Enter Your', name: 'Enter', desc: '', args: []);
  }

  /// `Already have an account?`
  String get orLogin {
    return Intl.message(
      'Already have an account?',
      name: 'orLogin',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get orSingUp {
    return Intl.message(
      'Don\'t have an account?',
      name: 'orSingUp',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message('Later', name: 'later', desc: '', args: []);
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

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
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

  /// `See All`
  String get SeeAll {
    return Intl.message('See All', name: 'SeeAll', desc: '', args: []);
  }

  /// `Popular 🔥`
  String get popular {
    return Intl.message('Popular 🔥', name: 'popular', desc: '', args: []);
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

  /// `Categories`
  String get Categories {
    return Intl.message('Categories', name: 'Categories', desc: '', args: []);
  }

  /// `Price`
  String get Price {
    return Intl.message('Price', name: 'Price', desc: '', args: []);
  }

  /// `Star Rating`
  String get StarRating {
    return Intl.message('Star Rating', name: 'StarRating', desc: '', args: []);
  }

  /// `Filter`
  String get Filter {
    return Intl.message('Filter', name: 'Filter', desc: '', args: []);
  }

  /// `Reset Filters`
  String get ResetFilters {
    return Intl.message(
      'Reset Filters',
      name: 'ResetFilters',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filters`
  String get ApplyFilters {
    return Intl.message(
      'Apply Filters',
      name: 'ApplyFilters',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get Setting {
    return Intl.message('Setting', name: 'Setting', desc: '', args: []);
  }

  /// `Your Card`
  String get YourCard {
    return Intl.message('Your Card', name: 'YourCard', desc: '', args: []);
  }

  /// `Security`
  String get Security {
    return Intl.message('Security', name: 'Security', desc: '', args: []);
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get Languages {
    return Intl.message('Languages', name: 'Languages', desc: '', args: []);
  }

  /// `Help and Support`
  String get Info {
    return Intl.message('Help and Support', name: 'Info', desc: '', args: []);
  }

  /// `Sorry! No items are here yet.`
  String get massageInCart {
    return Intl.message(
      'Sorry! No items are here yet.',
      name: 'massageInCart',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `32% OFF`
  String get offerPrice {
    return Intl.message('32% OFF', name: 'offerPrice', desc: '', args: []);
  }

  /// `the highest quality products`
  String get offerTittle {
    return Intl.message(
      'the highest quality products',
      name: 'offerTittle',
      desc: '',
      args: [],
    );
  }

  /// `Check it out >`
  String get checkout {
    return Intl.message('Check it out >', name: 'checkout', desc: '', args: []);
  }

  /// `Recommendation Service`
  String get Recommendation {
    return Intl.message(
      'Recommendation Service',
      name: 'Recommendation',
      desc: '',
      args: [],
    );
  }

  /// `Can take any photo in your room and get recommendation for you what is best for you`
  String get RecommendationDes {
    return Intl.message(
      'Can take any photo in your room and get recommendation for you what is best for you',
      name: 'RecommendationDes',
      desc: '',
      args: [],
    );
  }

  /// `More Service`
  String get Service {
    return Intl.message('More Service', name: 'Service', desc: '', args: []);
  }

  /// `tap here to get more service`
  String get ServiceDes {
    return Intl.message(
      'tap here to get more service',
      name: 'ServiceDes',
      desc: '',
      args: [],
    );
  }

  /// `Carpenter`
  String get Carpenter {
    return Intl.message('Carpenter', name: 'Carpenter', desc: '', args: []);
  }

  /// `can show you what is best for you`
  String get CarpenterDes {
    return Intl.message(
      'can show you what is best for you',
      name: 'CarpenterDes',
      desc: '',
      args: [],
    );
  }

  /// `Trucks`
  String get Trucks {
    return Intl.message('Trucks', name: 'Trucks', desc: '', args: []);
  }

  /// `Trucks can take ant Drivers you need to  To transfer the foundation`
  String get TrucksDes {
    return Intl.message(
      'Trucks can take ant Drivers you need to  To transfer the foundation',
      name: 'TrucksDes',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get Rent {
    return Intl.message('Rent', name: 'Rent', desc: '', args: []);
  }

  /// `For Rent Tools and Materials you need`
  String get RentDes {
    return Intl.message(
      'For Rent Tools and Materials you need',
      name: 'RentDes',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
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
