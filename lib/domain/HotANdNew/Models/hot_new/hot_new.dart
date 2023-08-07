import 'package:json_annotation/json_annotation.dart';

part 'hot_new.g.dart';

@JsonSerializable()
class HotNew {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  HotNew({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory HotNew.fromJson(Map<String, dynamic> json) {
    return _$HotNewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotNewToJson(this);
}
