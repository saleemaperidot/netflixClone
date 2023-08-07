import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'title')
  String? title;

  Result({
    this.id,
    this.posterPath,
    this.title,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
