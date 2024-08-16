import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/phone_number.dart';

part 'send_phone_code_result.freezed.dart';

@freezed
class SendCodePhoneResult with _$SendCodePhoneResult {
  factory SendCodePhoneResult.success(PhoneNumber phone) = Success;
  factory SendCodePhoneResult.error(String message) = Error;
}

//flutter pub run build_runner build
