import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/code_response.dart';

part 'check_phone_code_result.freezed.dart';

@freezed
class CheckPhoneCodeResult with _$CheckPhoneCodeResult {
  factory CheckPhoneCodeResult.success(CodeResponse code) = Success;
  factory CheckPhoneCodeResult.error(String message) = Error;
}

//flutter pub run build_runner build
