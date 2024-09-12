import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/sessions/model/session_response.dart';

part 'session_result.freezed.dart';

@freezed
class SessionResult with _$SessionResult {
  factory SessionResult.success(List<SessionResponse> sessions) = Success;
  factory SessionResult.error(String message) = Error;
}

//flutter pub run build_runner build
