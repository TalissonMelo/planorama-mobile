import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/auth/model/user_login.dart';

part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.success(UserLogin login) = Success;
  factory AuthResult.error(String message) = Error;
}

//flutter pub run build_runner build
