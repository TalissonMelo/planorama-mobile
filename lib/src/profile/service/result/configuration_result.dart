import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/profile/model/configuration.dart';

part 'configuration_result.freezed.dart';

@freezed
class ConfigurationResult with _$ConfigurationResult {
  factory ConfigurationResult.success(Configuration configuration) = Success;
  factory ConfigurationResult.error(String message) = Error;
}

//flutter pub run build_runner build
