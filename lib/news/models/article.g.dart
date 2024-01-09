// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      imageUrl: json['image_url'] as String,
      newsSite: json['news_site'] as String,
      summary: json['summary'] as String,
      publishedAt: json['published_at'] as String,
      updatedAt: json['updated_at'] as String,
      featured: json['featured'] as bool,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'news_site': instance.newsSite,
      'summary': instance.summary,
      'published_at': instance.publishedAt,
      'updated_at': instance.updatedAt,
      'featured': instance.featured,
    };
