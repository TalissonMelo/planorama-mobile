import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/member/domain/user_permissions.dart';

part 'user_permission_result.freezed.dart';

@freezed
class UserPermissionResult with _$UserPermissionResult {
  factory UserPermissionResult.success(UserPermissions user) = Success;
  factory UserPermissionResult.error(String message) = Error;
}

//flutter pub run build_runner build
