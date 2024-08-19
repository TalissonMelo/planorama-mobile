import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/code_response.dart';

part 'recover_password_result.freezed.dart';

@freezed
class RecoverPasswordResult with _$RecoverPasswordResult {
  factory RecoverPasswordResult.success(CodeResponse code) = Success;
  factory RecoverPasswordResult.error(String message) = Error;
}

//flutter pub run build_runner build
