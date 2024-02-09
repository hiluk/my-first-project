// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

@JsonSerializable()
class Blog {
  final int id;
  final String title;
  final String url;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'news_site')
  final String newsSite;
  final String summary;
  @JsonKey(name: 'published_at')
  final String publishedAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  bool featured;
  Blog({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
