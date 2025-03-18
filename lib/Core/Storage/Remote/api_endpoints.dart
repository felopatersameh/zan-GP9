class ApiEndpoints {
  static var baseUrl = 'https://darkturquoise-eagle-921470.hostingersite.com/api';
  
  static const String loginUser = '/login';
  static const String registerUser = '/register';
  static const String product = '/products';
  static const String productDetails = '/products/';
  static const String productFeatured = '$product/featured';
  static const String productPopular = '$product/popular';
  static const String changePassword = '/user/change-password';
  static const String secondApiUrl = 'https://second-api.example.com/v1';
  static const String thirdApiUrl = 'https://third-api.example.com/v1';
}