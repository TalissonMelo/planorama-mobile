const String baseUrl = "http://10.0.2.2:8080";

abstract class Endpoints {
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/v1/users';
  static const String createLegend = '$baseUrl/v1/legends';
  static const String listSchedule = '$baseUrl/v1/schedule';
  static const String validToken = '$baseUrl/validateToken';
  static const String listSchedules = '$baseUrl/v1/schedules';
  static const String sendPhoneCode = '$baseUrl/v1/users/passwords';
  static const String checkPhoneCode = '$baseUrl/v1/users/passwords/codes';
  static const String recoverPasswordCode = '$baseUrl/v1/users/passwords/codes';

  static const String listFreeTimesSchedules =
      '$baseUrl/v1/schedules/free-times';

  static String changeUserPassword(String userId) {
    return '$baseUrl/v1/users/$userId/passwords';
  }

  static String changeUserProfile(String userId) {
    return '$baseUrl/v1/users/$userId';
  }

  static String listLegend(String userId) {
    return '$baseUrl/v1/users/$userId/legends';
  }
}
