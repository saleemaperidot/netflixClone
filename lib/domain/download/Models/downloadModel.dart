import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloadModel.freezed.dart';
part 'downloadModel.g.dart';

@freezed
class downloadModel with _$downloadModel {
  const factory downloadModel({
    @JsonKey(name: "poster_path") 
    required String? posterPath,
    @JsonKey(name: "title") 
    required String? title,
  }) = _downloadModel;

  factory downloadModel.fromJson(Map<String, dynamic> json) =>
      _$downloadModelFromJson(json);
}
