import 'package:liberbox_mobile/src/recoverPassword/domain/change_password.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/code_response.dart';
import 'package:liberbox_mobile/src/recoverPassword/repository/recover_password_repository.dart';
import 'package:liberbox_mobile/src/recoverPassword/service/result/recover_password_result.dart';

class RecoverPasswordService {
  final recoverPasswordRepository = RecoverPasswordRepository();

  Future<RecoverPasswordResult> execute(ChangePassword password) async {
    final result = await recoverPasswordRepository.execute(password);

    try {
      CodeResponse code = CodeResponse.fromMap(result.data);
      return RecoverPasswordResult.success(code);
    } catch (error) {
      return RecoverPasswordResult.error(result.errorMessage ?? '');
    }
  }
}
