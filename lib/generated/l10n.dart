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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No Product Found`
  String get MessageEmptyProduct {
    return Intl.message(
      'No Product Found',
      name: 'MessageEmptyProduct',
      desc: '',
      args: [],
    );
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

  /// `Language changed successfully`
  String get messageChangeLanguageSuccess {
    return Intl.message(
      'Language changed successfully',
      name: 'messageChangeLanguageSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Guaranteed quality products`
  String get boarding1_title {
    return Intl.message(
      'Guaranteed quality products',
      name: 'boarding1_title',
      desc: '',
      args: [],
    );
  }

  /// `Always in a large and diverse selection of options. Guaranteed items, great design.`
  String get boarding1_body {
    return Intl.message(
      'Always in a large and diverse selection of options. Guaranteed items, great design.',
      name: 'boarding1_body',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive guarantee if the product doesn't suit you`
  String get boarding2_title {
    return Intl.message(
      'Comprehensive guarantee if the product doesn\'t suit you',
      name: 'boarding2_title',
      desc: '',
      args: [],
    );
  }

  /// `Always in a large and diverse selection of options. Guaranteed items, great design.`
  String get boarding2_body {
    return Intl.message(
      'Always in a large and diverse selection of options. Guaranteed items, great design.',
      name: 'boarding2_body',
      desc: '',
      args: [],
    );
  }

  /// `Let's achieve your housing needs together`
  String get boarding3_title {
    return Intl.message(
      'Let\'s achieve your housing needs together',
      name: 'boarding3_title',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of text that can be replaced in the same space.`
  String get boarding3_body {
    return Intl.message(
      'This text is an example of text that can be replaced in the same space.',
      name: 'boarding3_body',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Find the perfect furniture for your beautiful home`
  String get TitleStartApp {
    return Intl.message(
      'Find the perfect furniture for your beautiful home',
      name: 'TitleStartApp',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get LoginByGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'LoginByGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get CurrentPassword {
    return Intl.message(
      'Current Password',
      name: 'CurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation Password`
  String get ConfirmationPassword {
    return Intl.message(
      'Confirmation Password',
      name: 'ConfirmationPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Logged in successfully`
  String get messageLoginSuccess {
    return Intl.message(
      'Logged in successfully',
      name: 'messageLoginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully`
  String get messageRegisterSuccess {
    return Intl.message(
      'Registered successfully',
      name: 'messageRegisterSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Logged out successfully`
  String get messageLogoutSuccess {
    return Intl.message(
      'Logged out successfully',
      name: 'messageLogoutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get Enter {
    return Intl.message(
      'Enter',
      name: 'Enter',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get AddAddress {
    return Intl.message(
      'Add Address',
      name: 'AddAddress',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Address Line`
  String get address_line {
    return Intl.message(
      'Address Line',
      name: 'address_line',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postal_code {
    return Intl.message(
      'Postal Code',
      name: 'postal_code',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get Bio {
    return Intl.message(
      'Bio',
      name: 'Bio',
      desc: '',
      args: [],
    );
  }

  /// `Profile Photo`
  String get ProfilePhoto {
    return Intl.message(
      'Profile Photo',
      name: 'ProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `ID Card`
  String get IDCard_Passport {
    return Intl.message(
      'ID Card',
      name: 'IDCard_Passport',
      desc: '',
      args: [],
    );
  }

  /// `Police Record`
  String get PoliceRecord {
    return Intl.message(
      'Police Record',
      name: 'PoliceRecord',
      desc: '',
      args: [],
    );
  }

  /// `Workshop`
  String get Workshop {
    return Intl.message(
      'Workshop',
      name: 'Workshop',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get UploadImage {
    return Intl.message(
      'Upload Image',
      name: 'UploadImage',
      desc: '',
      args: [],
    );
  }

  /// `No Image Selected`
  String get NoImageSelected {
    return Intl.message(
      'No Image Selected',
      name: 'NoImageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Upload clear image of yourself.`
  String get UploadImageCarpenter {
    return Intl.message(
      'Upload clear image of yourself.',
      name: 'UploadImageCarpenter',
      desc: '',
      args: [],
    );
  }

  /// `Upload clear image of the ID card.`
  String get IDCard_PassportDescription {
    return Intl.message(
      'Upload clear image of the ID card.',
      name: 'IDCard_PassportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Upload clear image of the police record.`
  String get PoliceRecordDescription {
    return Intl.message(
      'Upload clear image of the police record.',
      name: 'PoliceRecordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Upload clear image of the workshop.`
  String get WorkshopDescription {
    return Intl.message(
      'Upload clear image of the workshop.',
      name: 'WorkshopDescription',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get Scan {
    return Intl.message(
      'Scan',
      name: 'Scan',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get Explore {
    return Intl.message(
      'Explore',
      name: 'Explore',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get Favourite {
    return Intl.message(
      'Favorite',
      name: 'Favourite',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get SeeAll {
    return Intl.message(
      'See All',
      name: 'SeeAll',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Good Night',
      name: 'GoodNight',
      desc: '',
      args: [],
    );
  }

  /// `Featured`
  String get Featured {
    return Intl.message(
      'Featured',
      name: 'Featured',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get StarRating {
    return Intl.message(
      'Rating',
      name: 'StarRating',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get Filter {
    return Intl.message(
      'Filter',
      name: 'Filter',
      desc: '',
      args: [],
    );
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

  /// `Settings`
  String get Setting {
    return Intl.message(
      'Settings',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `Your Card`
  String get YourCard {
    return Intl.message(
      'Your Card',
      name: 'YourCard',
      desc: '',
      args: [],
    );
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

  /// `Security`
  String get Security {
    return Intl.message(
      'Security',
      name: 'Security',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get Languages {
    return Intl.message(
      'Languages',
      name: 'Languages',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get Info {
    return Intl.message(
      'Help & Support',
      name: 'Info',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Workshop Dashboard`
  String get WorkshopDashboard {
    return Intl.message(
      'Workshop Dashboard',
      name: 'WorkshopDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Sorry! No items here yet.`
  String get massageInCart {
    return Intl.message(
      'Sorry! No items here yet.',
      name: 'massageInCart',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get offerPrice {
    return Intl.message(
      'Off',
      name: 'offerPrice',
      desc: '',
      args: [],
    );
  }

  /// `Top Quality Products`
  String get offerTittle {
    return Intl.message(
      'Top Quality Products',
      name: 'offerTittle',
      desc: '',
      args: [],
    );
  }

  /// `Check it out >`
  String get checkout {
    return Intl.message(
      'Check it out >',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Service Recommendation`
  String get Recommendation {
    return Intl.message(
      'Service Recommendation',
      name: 'Recommendation',
      desc: '',
      args: [],
    );
  }

  /// `You can take any picture in your room and get a recommendation on what's best for you`
  String get RecommendationDes {
    return Intl.message(
      'You can take any picture in your room and get a recommendation on what\'s best for you',
      name: 'RecommendationDes',
      desc: '',
      args: [],
    );
  }

  /// `More Services`
  String get Service {
    return Intl.message(
      'More Services',
      name: 'Service',
      desc: '',
      args: [],
    );
  }

  /// `Tap here for more services`
  String get ServiceDes {
    return Intl.message(
      'Tap here for more services',
      name: 'ServiceDes',
      desc: '',
      args: [],
    );
  }

  /// `Carpenter`
  String get Carpenter {
    return Intl.message(
      'Carpenter',
      name: 'Carpenter',
      desc: '',
      args: [],
    );
  }

  /// `It can show you what is best for you`
  String get CarpenterDes {
    return Intl.message(
      'It can show you what is best for you',
      name: 'CarpenterDes',
      desc: '',
      args: [],
    );
  }

  /// `Trucks`
  String get Trucks {
    return Intl.message(
      'Trucks',
      name: 'Trucks',
      desc: '',
      args: [],
    );
  }

  /// `Trucks can take the loads you need to move the furniture`
  String get TrucksDes {
    return Intl.message(
      'Trucks can take the loads you need to move the furniture',
      name: 'TrucksDes',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get Rent {
    return Intl.message(
      'Rent',
      name: 'Rent',
      desc: '',
      args: [],
    );
  }

  /// `For rental tools and materials you need`
  String get RentDes {
    return Intl.message(
      'For rental tools and materials you need',
      name: 'RentDes',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `In Stock`
  String get InStock {
    return Intl.message(
      'In Stock',
      name: 'InStock',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get OutStock {
    return Intl.message(
      'Out of Stock',
      name: 'OutStock',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get Color {
    return Intl.message(
      'Color',
      name: 'Color',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get Size {
    return Intl.message(
      'Size',
      name: 'Size',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message(
      'Quantity',
      name: 'Quantity',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get AddToCart {
    return Intl.message(
      'Add to Cart',
      name: 'AddToCart',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get BuyNow {
    return Intl.message(
      'Buy Now',
      name: 'BuyNow',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message(
      'Reviews',
      name: 'Reviews',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details {
    return Intl.message(
      'Details',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reviews`
  String get CustomerReviews {
    return Intl.message(
      'Customer Reviews',
      name: 'CustomerReviews',
      desc: '',
      args: [],
    );
  }

  /// `Add Review`
  String get AddReview {
    return Intl.message(
      'Add Review',
      name: 'AddReview',
      desc: '',
      args: [],
    );
  }

  /// `Your Rating`
  String get YourRating {
    return Intl.message(
      'Your Rating',
      name: 'YourRating',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `CM`
  String get CM {
    return Intl.message(
      'CM',
      name: 'CM',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get CouponCode {
    return Intl.message(
      'Coupon Code',
      name: 'CouponCode',
      desc: '',
      args: [],
    );
  }

  /// `Promo code`
  String get PromoCode {
    return Intl.message(
      'Promo code',
      name: 'PromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get Subtotal {
    return Intl.message(
      'Subtotal',
      name: 'Subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Charge`
  String get DeliveryCharge {
    return Intl.message(
      'Delivery Charge',
      name: 'DeliveryCharge',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Discount`
  String get CouponDiscount {
    return Intl.message(
      'Coupon Discount',
      name: 'CouponDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get TotalAmount {
    return Intl.message(
      'Total amount',
      name: 'TotalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Smart Assistant`
  String get SmartAssistantFeature {
    return Intl.message(
      'Smart Assistant',
      name: 'SmartAssistantFeature',
      desc: '',
      args: [],
    );
  }

  /// `can chat with it and answer any question you have about furniture`
  String get SmartAssistantFeatureDes {
    return Intl.message(
      'can chat with it and answer any question you have about furniture',
      name: 'SmartAssistantFeatureDes',
      desc: '',
      args: [],
    );
  }

  /// `Furniture Recommendation`
  String get FurnitureRecommendationFeature {
    return Intl.message(
      'Furniture Recommendation',
      name: 'FurnitureRecommendationFeature',
      desc: '',
      args: [],
    );
  }

  /// `Empty Space Calculator`
  String get EmptySpaceCalculatorFeature {
    return Intl.message(
      'Empty Space Calculator',
      name: 'EmptySpaceCalculatorFeature',
      desc: '',
      args: [],
    );
  }

  /// `Furniture Measurement`
  String get FurnitureMeasurementFeature {
    return Intl.message(
      'Furniture Measurement',
      name: 'FurnitureMeasurementFeature',
      desc: '',
      args: [],
    );
  }

  /// `Room Measurement`
  String get RoomMeasurementFeature {
    return Intl.message(
      'Room Measurement',
      name: 'RoomMeasurementFeature',
      desc: '',
      args: [],
    );
  }

  /// `Carpenter Service`
  String get Carpenter_service {
    return Intl.message(
      'Carpenter Service',
      name: 'Carpenter_service',
      desc: '',
      args: [],
    );
  }

  /// `Select the type of Service you need.`
  String get Carpentry_selection {
    return Intl.message(
      'Select the type of Service you need.',
      name: 'Carpentry_selection',
      desc: '',
      args: [],
    );
  }

  /// `Required Person`
  String get Required_person {
    return Intl.message(
      'Required Person',
      name: 'Required_person',
      desc: '',
      args: [],
    );
  }

  /// `Regular cost is 252 EGP/hr. Total cost will be calculated later.`
  String get Regular_cost {
    return Intl.message(
      'Regular cost is 252 EGP/hr. Total cost will be calculated later.',
      name: 'Regular_cost',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get Proceed {
    return Intl.message(
      'Proceed',
      name: 'Proceed',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Pick time`
  String get PickTime {
    return Intl.message(
      'Pick time',
      name: 'PickTime',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Years Experience`
  String get years_experience {
    return Intl.message(
      'Years Experience',
      name: 'years_experience',
      desc: '',
      args: [],
    );
  }

  /// `Hourly Rate`
  String get hourly_rate {
    return Intl.message(
      'Hourly Rate',
      name: 'hourly_rate',
      desc: '',
      args: [],
    );
  }

  /// `Average Rating`
  String get average_rating {
    return Intl.message(
      'Average Rating',
      name: 'average_rating',
      desc: '',
      args: [],
    );
  }

  /// `Completed Services`
  String get completed_services {
    return Intl.message(
      'Completed Services',
      name: 'completed_services',
      desc: '',
      args: [],
    );
  }

  /// `Is Available`
  String get available {
    return Intl.message(
      'Is Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `ID Card Photo`
  String get id_card_photo_url {
    return Intl.message(
      'ID Card Photo',
      name: 'id_card_photo_url',
      desc: '',
      args: [],
    );
  }

  /// `Police Record Photo`
  String get police_record_photo_url {
    return Intl.message(
      'Police Record Photo',
      name: 'police_record_photo_url',
      desc: '',
      args: [],
    );
  }

  /// `Workshop Photo`
  String get workshop_photo_url {
    return Intl.message(
      'Workshop Photo',
      name: 'workshop_photo_url',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Discount`
  String get couponDiscount {
    return Intl.message(
      'Coupon Discount',
      name: 'couponDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get Note {
    return Intl.message(
      'Note',
      name: 'Note',
      desc: '',
      args: [],
    );
  }

  /// `Working Hour`
  String get WorkingPrice {
    return Intl.message(
      'Working Hour',
      name: 'WorkingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Service Charge`
  String get ServiceCharge {
    return Intl.message(
      'Service Charge',
      name: 'ServiceCharge',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get Discount {
    return Intl.message(
      'Discount',
      name: 'Discount',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Cost`
  String get EstimatedCost {
    return Intl.message(
      'Estimated Cost',
      name: 'EstimatedCost',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get Cash {
    return Intl.message(
      'Cash',
      name: 'Cash',
      desc: '',
      args: [],
    );
  }

  /// `OnlinePayment`
  String get OnlinePayment {
    return Intl.message(
      'OnlinePayment',
      name: 'OnlinePayment',
      desc: '',
      args: [],
    );
  }

  /// `One Hour`
  String get hour {
    return Intl.message(
      'One Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get Length {
    return Intl.message(
      'Length',
      name: 'Length',
      desc: '',
      args: [],
    );
  }

  /// `Width`
  String get Width {
    return Intl.message(
      'Width',
      name: 'Width',
      desc: '',
      args: [],
    );
  }

  /// `Room type`
  String get RoomType {
    return Intl.message(
      'Room type',
      name: 'RoomType',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get Photo {
    return Intl.message(
      'Photo',
      name: 'Photo',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message(
      'Camera',
      name: 'Camera',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Profile Status`
  String get profile_status {
    return Intl.message(
      'Profile Status',
      name: 'profile_status',
      desc: '',
      args: [],
    );
  }

  /// `Total Earnings`
  String get total_earnings {
    return Intl.message(
      'Total Earnings',
      name: 'total_earnings',
      desc: '',
      args: [],
    );
  }

  /// `Completed Orders`
  String get completed_orders {
    return Intl.message(
      'Completed Orders',
      name: 'completed_orders',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Pending Orders`
  String get pending_orders {
    return Intl.message(
      'Pending Orders',
      name: 'pending_orders',
      desc: '',
      args: [],
    );
  }

  /// `Today Orders`
  String get today_orders {
    return Intl.message(
      'Today Orders',
      name: 'today_orders',
      desc: '',
      args: [],
    );
  }

  /// `No Today Orders`
  String get no_today_orders {
    return Intl.message(
      'No Today Orders',
      name: 'no_today_orders',
      desc: '',
      args: [],
    );
  }

  /// `No Pending Orders`
  String get no_pending_orders {
    return Intl.message(
      'No Pending Orders',
      name: 'no_pending_orders',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Sales`
  String get monthly_sales {
    return Intl.message(
      'Monthly Sales',
      name: 'monthly_sales',
      desc: '',
      args: [],
    );
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
