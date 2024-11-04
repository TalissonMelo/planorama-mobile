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

  static String changeUserSettings(String userId) {
    return '$baseUrlProd/settings/users/$userId';
  }

  static String listSchedule(String userId) {
    return '$baseUrlProd/schedules/users/$userId';
  }

  static String changeUserProfile(String userId) {
    return '$baseUrlProd/users/$userId';
  }

  static const String listSchedules = '$baseUrl/v1/schedules';
  static const String userProfilePermissions = '$baseUrl/v1/users/profiles';

  static const String listFreeTimesSchedules =
      '$baseUrl/v1/schedules/free-times';

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
