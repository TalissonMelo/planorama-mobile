const String baseUrl = "http://10.0.2.2:8080";

abstract class Endpoints {
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/v1/users';
  static const String validToken = '$baseUrl/validateToken';
  static const String sendPhoneCode = '$baseUrl/v1/users/passwords';
  static const String checkPhoneCode = '$baseUrl/v1/users/passwords/codes';
  static const String recoverPasswordCode = '$baseUrl/v1/users/passwords/codes';
}
