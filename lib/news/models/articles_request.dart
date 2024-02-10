class ArticlesRequest {
  final String newsSite;
  final String titleContains;
  final int limit;
  final int offset;
  ArticlesRequest({
    this.newsSite = '',
    this.titleContains = '',
    this.limit = 20,
    this.offset = 0,
  });

  Map<String, dynamic> toJson() => {
        'news_site': newsSite,
        'title_contains': titleContains,
        'limit': limit,
        'offset': offset,
      };
}
