import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiPassword {
  static String password = dotenv.get('ApiPassword');
}