// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloadModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

downloadModel _$downloadModelFromJson(Map<String, dynamic> json) {
  return _downloadModel.fromJson(json);
}

/// @nodoc
mixin _$downloadModel {
  @JsonKey(name: "poster_path")
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $downloadModelCopyWith<downloadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $downloadModelCopyWith<$Res> {
  factory $downloadModelCopyWith(
          downloadModel value, $Res Function(downloadModel) then) =
      _$downloadModelCopyWithImpl<$Res, downloadModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class _$downloadModelCopyWithImpl<$Res, $Val extends downloadModel>
    implements $downloadModelCopyWith<$Res> {
  _$downloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_downloadModelCopyWith<$Res>
    implements $downloadModelCopyWith<$Res> {
  factory _$$_downloadModelCopyWith(
          _$_downloadModel value, $Res Function(_$_downloadModel) then) =
      __$$_downloadModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "poster_path") String? posterPath,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class __$$_downloadModelCopyWithImpl<$Res>
    extends _$downloadModelCopyWithImpl<$Res, _$_downloadModel>
    implements _$$_downloadModelCopyWith<$Res> {
  __$$_downloadModelCopyWithImpl(
      _$_downloadModel _value, $Res Function(_$_downloadModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_downloadModel(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_downloadModel implements _downloadModel {
  const _$_downloadModel(
      {@JsonKey(name: "poster_path") required this.posterPath,
      @JsonKey(name: "title") required this.title});

  factory _$_downloadModel.fromJson(Map<String, dynamic> json) =>
      _$$_downloadModelFromJson(json);

  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @override
  @JsonKey(name: "title")
  final String? title;

  @override
  String toString() {
    return 'downloadModel(posterPath: $posterPath, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_downloadModel &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, posterPath, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_downloadModelCopyWith<_$_downloadModel> get copyWith =>
      __$$_downloadModelCopyWithImpl<_$_downloadModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_downloadModelToJson(
      this,
    );
  }
}

abstract class _downloadModel implements downloadModel {
  const factory _downloadModel(
      {@JsonKey(name: "poster_path") required final String? posterPath,
      @JsonKey(name: "title") required final String? title}) = _$_downloadModel;

  factory _downloadModel.fromJson(Map<String, dynamic> json) =
      _$_downloadModel.fromJson;

  @override
  @JsonKey(name: "poster_path")
  String? get posterPath;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_downloadModelCopyWith<_$_downloadModel> get copyWith =>
      throw _privateConstructorUsedError;
}
