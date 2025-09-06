import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEndPoint {
  static const String baseUrlStripe = '';
  static const String stripe = 'https://api.stripe.com/v1/payment_intents';
  static const String ephemeral  = 'https://api.stripe.com/v1/ephemeral_keys';
}

class ApiKeys {
  static String secretKey = dotenv.get('secretKey');
  static String publishKey = dotenv.get('publishKey');
  static String idCostumer = dotenv.get('idCostumer');
}