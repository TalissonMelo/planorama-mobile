const String baseUrl = "http://10.0.2.2:8080";

abstract class Endpoints {
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/v1/users';
}
