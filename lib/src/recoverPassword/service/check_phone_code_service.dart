import 'package:liberbox_mobile/src/recoverPassword/domain/code_request.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/code_response.dart';
import 'package:liberbox_mobile/src/recoverPassword/repository/check_phone_code_repository.dart';
import 'package:liberbox_mobile/src/recoverPassword/service/result/check_phone_code_result.dart';

class CheckPhoneCodeService {
  final checkPhoneCodeRepository = CheckPhoneCodeRepository();

  Future<CheckPhoneCodeResult> execute(CodeRequest code) async {
    final result = await checkPhoneCodeRepository.execute(code);

    try {
      CodeResponse code = CodeResponse.fromMap(result.data);
      return CheckPhoneCodeResult.success(code);
    } catch (error) {
      return CheckPhoneCodeResult.error(result.errorMessage ?? '');
    }
  }
}
