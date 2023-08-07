// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_r_esult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchREsult _$SearchREsultFromJson(Map<String, dynamic> json) => SearchREsult(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchREsultToJson(SearchREsult instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
