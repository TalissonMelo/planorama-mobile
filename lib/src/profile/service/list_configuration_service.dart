import 'package:liberbox_mobile/src/profile/model/configuration.dart';
import 'package:liberbox_mobile/src/profile/repository/list_configuration_repository.dart';
import 'package:liberbox_mobile/src/profile/service/result/configuration_result.dart';

class ListConfigurationService {
  final configurationRepository = ListConfigurationRepository();

  Future<ConfigurationResult> execute(String userId, String token) async {
    final result = await configurationRepository.execute(
      userId,
      token,
    );

    try {
      if (result.success) {
        Configuration configuration = Configuration.fromMap(result.data);
        return ConfigurationResult.success(configuration);
      } else {
        return ConfigurationResult.error(
            result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return ConfigurationResult.error(result.errorMessage ?? '');
    }
  }
}
