import 'package:liberbox_mobile/src/recoverPassword/domain/phone_number.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/recover_email.dart';
import 'package:liberbox_mobile/src/recoverPassword/repository/send_phone_code_repository.dart';
import 'package:liberbox_mobile/src/recoverPassword/service/result/send_phone_code_result.dart';

class SendPhoneCodeService {
  final sendPhoneCodeRepository = SendPhoneCodeRepository();

  Future<SendCodePhoneResult> execute(RecoverEmail email) async {
    final result = await sendPhoneCodeRepository.execute(email);

    try {
      PhoneNumber phone = PhoneNumber.fromMap(result.data);
      return SendCodePhoneResult.success(phone);
    } catch (error) {
      return SendCodePhoneResult.error(result.errorMessage ?? '');
    }
  }
}
