// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_request.freezed.dart';
part 'articles_request.g.dart';

@freezed
class ArticlesRequest with _$ArticlesRequest {
  factory ArticlesRequest({
    @JsonKey(name: 'title_contains') @Default('') String titleContains,
    @Default(20) int limit,
    @Default(0) int offset,
  }) = _ArticlesRequest;

  factory ArticlesRequest.fromJson(Map<String, dynamic> json) =>
      _$ArticlesRequestFromJson(json);
}
