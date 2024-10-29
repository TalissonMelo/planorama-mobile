import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

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

    dio.Dio dioClient = dio.Dio();

    try {
      dio.Response response = await dioClient.request(
        url,
        options: dio.Options(
          headers: defaultHeaders,
          method: methodHttp,
        ),
        data: body,
        queryParameters: params,
      );

      return CustomApiAdvice(success: true, data: response.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 403) {
        Get.offAllNamed(PagesRoutes.loginInRoute);
        return CustomApiAdvice(
          success: false,
          errorMessage: 'Sessão expirada. Efetue novamente o login.',
        );
      }
      return CustomApiAdvice(success: false, errorMessage: error.message);
    } catch (error) {
      return CustomApiAdvice(success: false, errorMessage: error.toString());
    }
  }
}
