import 'package:dio/dio.dart';

class HttpManager {
  Future restRequest({
    required String url,
    required String methodHttp,
    Map? headers,
    Map? body,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-UserID': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: methodHttp,
        ),
        data: body,
      );

      return response.data;
    } on DioError catch (error) {
      error.response?.data ?? {};
    } catch (error) {
      return {};
    }
  }
}
