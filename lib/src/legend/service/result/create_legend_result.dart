import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';

part 'create_legend_result.freezed.dart';

@freezed
class CreateLegendResult with _$CreateLegendResult {
  factory CreateLegendResult.success(LegendResponse legend) = Success;
  factory CreateLegendResult.error(String message) = Error;
}

//flutter pub run build_runner build
