import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/user/domain/user.dart';

part 'sign_up_result.freezed.dart';

@freezed
class SignUpResult with _$SignUpResult {
  factory SignUpResult.success(User user) = Success;
  factory SignUpResult.error(String message) = Error;
}

//flutter pub run build_runner build
