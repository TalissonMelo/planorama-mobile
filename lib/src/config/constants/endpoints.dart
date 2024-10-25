const String baseUrl = "http://10.0.2.2:8080";
const String baseUrlProd =
    'https://p1of6von68.execute-api.us-east-1.amazonaws.com/prod';

abstract class Endpoints {
  static String createLegend(String userId) {
    return '$baseUrlProd/captions/users/$userId';
  }

  static String listLegend(String userId) {
    return '$baseUrlProd/captions/users/$userId';
  }

  static const String signup = '$baseUrl/v1/users';
  static const String listSchedule = '$baseUrl/v1/schedule';
  static const String validToken = '$baseUrl/validateToken';
  static const String listSchedules = '$baseUrl/v1/schedules';
  static const String sendPhoneCode = '$baseUrl/v1/users/passwords';
  static const String checkPhoneCode = '$baseUrl/v1/users/passwords/codes';
  static const String userProfilePermissions = '$baseUrl/v1/users/profiles';
  static const String recoverPasswordCode = '$baseUrl/v1/users/passwords/codes';

  static const String listFreeTimesSchedules =
      '$baseUrl/v1/schedules/free-times';

  static String changeUserPassword(String userId) {
    return '$baseUrl/v1/users/$userId/passwords';
  }

  static String changeUserProfile(String userId) {
    return '$baseUrl/v1/users/$userId';
  }

  static String sessionsToScheduleId(String scheduleId) {
    return '$baseUrl/v1/schedule/$scheduleId/sessions';
  }

  static String listLegendScheduleId(String scheduleId) {
    return '$baseUrl/v1/schedules/$scheduleId/legends';
  }

  static String createMessage(String sessionId) {
    return '$baseUrl/v1/sessions/$sessionId/chat';
  }
}
