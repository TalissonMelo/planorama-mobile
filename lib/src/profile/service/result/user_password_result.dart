import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_password_result.freezed.dart';

@freezed
class UserPasswordResult with _$UserPasswordResult {
  factory UserPasswordResult.success() = Success;
  factory UserPasswordResult.error(String message) = Error;
}

//flutter pub run build_runner build
