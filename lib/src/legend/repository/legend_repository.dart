import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/config/constants/endpoints.dart';
import 'package:liberbox_mobile/src/config/entity/http_methods.dart';
import 'package:liberbox_mobile/src/config/http_manager.dart';
import 'package:liberbox_mobile/src/legend/model/legend_request.dart';

class LegendRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CustomApiAdvice> createLegend(
    String userId,
    String token,
    LegendRequest legend,
  ) async {
    return await _httpManager.restRequest(
        url: Endpoints.createLegend(userId),
        methodHttp: HttpMethods.post,
        body: legend.toJson(),
        headers: {
          'Authorization': token,
        });
  }

  Future<CustomApiAdvice> listLegend(String userId, String token) async {
    return await _httpManager.restRequest(
        url: Endpoints.listLegend(userId),
        methodHttp: HttpMethods.get,
        headers: {
          'Authorization': token,
          'X-UserID': userId,
        });
  }
}
