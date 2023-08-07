import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_r_esult.g.dart';

@JsonSerializable()
class SearchREsult {
  List<Result> results;

  SearchREsult({
    required this.results,
  });

  factory SearchREsult.fromJson(Map<String, dynamic> json) {
    return _$SearchREsultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchREsultToJson(this);
}
