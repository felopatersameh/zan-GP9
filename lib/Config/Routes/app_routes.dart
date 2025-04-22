import 'package:flutter/material.dart';
import '../../Core/Services/Map/select_location.dart';
import '../../Features/App/WorkshopDashboard/Main/Pages/main_dashbored_screen.dart';
import '../../Features/Global/Authentication/presentation/pages/authentication_screen.dart';
import '../../Features/Global/Boarding/boarding_screen.dart';
import '../../Features/Global/Splash/splash_screen.dart';
import '../../Features/App/common/Cart/presentation/pages/cart_screen.dart';
import '../../Features/App/common/Favorite/favorite_screen.dart';
import '../../Features/App/common/Main/pages/main_app_screen.dart';
import '../../Features/App/common/ProductsDetails/presentation/pages/product_details.dart';
import '../../Features/App/common/View_3D/Page/screen_3d.dart';
import '../../Features/App/Service/AreaMeasurement/Pages/area_measurement_screen.dart';
import '../../Features/App/Service/Carpenter/presentation/pages/carpenters_screens.dart';
import '../../Features/App/Service/Chat/presentation/pages/chat_screeen.dart';
import '../../Features/App/Service/Recommendation/presentation/pages/recommendation_screen.dart';
import '../../Features/App/common/Search/presentation/pages/search_screen.dart';
import '../../Features/App/User/presentation/pages/add_address_screen.dart';
import '../../Features/App/User/presentation/pages/change_password_screen.dart';
import '../../Features/App/User/presentation/pages/user_edite_screen.dart';
import 'route_name.dart';

class AppRouteBuilders {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _defaultPageRoute(const SplashScreen());
      case AppRoutes.boarding:
        return _defaultPageRoute(const BoardingScreen());
      case AppRoutes.authentication:
        return _defaultPageRoute(const AuthenticationScreen());
      case AppRoutes.main:
        return _defaultPageRoute(const MainAppScreen());
      case AppRoutes.search:
        return _defaultPageRoute(const SearchScreen());
      case AppRoutes.cart:
        return _defaultPageRoute(const CartScreen());
      case AppRoutes.favorite:
        return _defaultPageRoute(const FavoriteScreen());
      case AppRoutes.screen3D:
        // final args = settings.arguments as String;
        return _defaultPageRoute(Screen3D());
      case AppRoutes.areaMeasurementScreen:
        return _defaultPageRoute(const AreaMeasurementScreen());
      case AppRoutes.userEditeScreen:
        return _defaultPageRoute(const UserEditeScreen());
      case AppRoutes.changePasswordScreen:
        return _defaultPageRoute(const ChangePasswordScreen());
      case AppRoutes.addAddressScreen:
        return _defaultPageRoute(const AddAddressScreen());
      case AppRoutes.selectLocation:
        return _defaultPageRoute(const SelectLocation());
      case AppRoutes.carpenterScreen:
        return _defaultPageRoute(const CarpentersScreen());
      case AppRoutes.chatPage:
        return _defaultPageRoute(const ChatAiScreen());
      case AppRoutes.recommendation:
        return _defaultPageRoute(const RecommendationScreen());
      case AppRoutes.productDetails:
        final args = settings.arguments as int;
        return _defaultPageRoute(ProductDetailsScreen(
          id: args,
        ));
      case AppRoutes.dashBoredMainScreen:
        return _defaultPageRoute(const MainDashBoredScreen());
      default:
        return _errorRoute('No route defined for "${settings.name}"');
    }
  }

  static MaterialPageRoute<dynamic> _defaultPageRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body:
            Center(child: Text(message, style: const TextStyle(fontSize: 18))),
      ),
    );
  }
}
