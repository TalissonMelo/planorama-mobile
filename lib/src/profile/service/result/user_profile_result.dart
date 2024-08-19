import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/profile/model/user_response.dart';

part 'user_profile_result.freezed.dart';

@freezed
class UserProfileResult with _$UserProfileResult {
  factory UserProfileResult.success(UserResponse user) = Success;
  factory UserProfileResult.error(String message) = Error;
}

//flutter pub run build_runner build
