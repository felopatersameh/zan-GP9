class ApiEndpoints {
  static var baseUrl = 'https://moccasin-manatee-172732.hostingersite.com/api';
  
  static const String loginUser = '/login';
  static const String registerUser = '/register';
  static const String profileUser = '/profile';
  static const String product = '/products';
  static const String productDetails = '/products/';
  static const String productFeatured = '$product/featured';
  static const String productPopular = '$product/popular';
  static const String allCategory = '/categories';
  static const String getProductsByCategories = '$allCategory/'; // + products
  static const String cart = '/cart'; // + products
  static const String addCart = '/$cart/add'; // + products
}