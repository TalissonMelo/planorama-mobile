import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';

part 'list_legend_result.freezed.dart';

@freezed
class ListLegendResult with _$ListLegendResult {
  factory ListLegendResult.success(List<LegendResponse> legend) = Success;
  factory ListLegendResult.error(String message) = Error;
}

//flutter pub run build_runner build
