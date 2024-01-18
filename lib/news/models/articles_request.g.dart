// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticlesRequestImpl _$$ArticlesRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticlesRequestImpl(
      titleContains: json['title_contains'] as String,
      limit: json['limit'] as int? ?? 20,
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$$ArticlesRequestImplToJson(
        _$ArticlesRequestImpl instance) =>
    <String, dynamic>{
      'title_contains': instance.titleContains,
      'limit': instance.limit,
      'offset': instance.offset,
    };
