class ApiEndpoints {
  static var baseUrl = 'https://moccasin-manatee-172732.hostingersite.com/api/';

  // * Automation page
  static const String loginUser = 'login';
  static const String registerUser = 'register';
  static const String refreshToken = 'refresh';
  static const String logout = 'logout';

  //* profile page
  static const String getUser = 'profile';
  static const String updateUser = 'user/profile/update';
  static const String changePassword = 'user/change-password';

  //* home page
  static const String product = 'products';
  static const String productDetails = '$product/';
  static const String productFeatured = '$product/featured';
  static const String productPopular = '$product/popular';

  //* categories page
  static const String allCategory = 'categories';
  static const String getProductsByCategories = '$allCategory/';

  //* cart page
  static const String cart = '/cart';
  static const String addCart = '$cart/add';
  static const String updateCart = '$cart/update';
  static const String removeCart = '$cart/remove';
  static const String clearCart = '$cart/clear';
  static const String applyCoupon = '$cart/apply-coupon';
  static const String removeCoupon = '$cart/remove-coupon';

  //* Carpenter Services EndPoint
  static const String allCarpentryServices = "carpentry-services";
  static const String carpenters = "carpenters";
}
