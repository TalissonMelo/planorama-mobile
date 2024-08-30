import 'package:dio/dio.dart';
import 'package:liberbox_mobile/src/components/custom_api_advice.dart';

class HttpManager {
  Future<CustomApiAdvice> restRequest({
    required String url,
    required String methodHttp,
    Map? headers,
    Map? body,
    Map<String, dynamic>? params,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
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
        queryParameters: params,
      );

      return CustomApiAdvice(success: true, data: response.data);
    } on DioError catch (error) {
      return CustomApiAdvice(success: false, errorMessage: error.message);
    } catch (error) {
      return CustomApiAdvice(success: false, errorMessage: error.toString());
    }
  }
}
