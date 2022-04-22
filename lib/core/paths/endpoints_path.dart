import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndpointPath {
  static String endPoint = dotenv.env['endpointServices']!;
  static String products = dotenv.env['pathProducts']!;
  static String mediosPay = dotenv.env['pathMediosPago']!;
}