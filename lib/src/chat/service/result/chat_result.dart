import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/chat/domain/message_response.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';

part 'chat_result.freezed.dart';

@freezed
class ChatResult with _$ChatResult {
  factory ChatResult.success(MessageResponse message) = Success;
  factory ChatResult.error(String message) = Error;
}

//flutter pub run build_runner build
