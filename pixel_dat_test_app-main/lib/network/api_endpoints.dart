import 'package:pixel_dat_test_app/utils/api_endpoints_config.dart';

final baseUrl = AppConfig.baseUrl;

class _AuthEndpoints {
  final registerCustomer = '$baseUrl/signup';
  final authUser = '$baseUrl/auth-user';
  final login = '$baseUrl/login';
}

final authEndpoints = _AuthEndpoints();
