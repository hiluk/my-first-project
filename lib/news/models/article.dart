// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article({
    required int id,
    required String title,
    required String url,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'news_site') required String newsSite,
    required String summary,
    @JsonKey(name: 'published_at') required String publishedAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required bool featured,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
