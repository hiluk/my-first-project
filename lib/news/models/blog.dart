class Blog {
  final int id;
  final String title;
  final String url;

  final String imageUrl;

  final String newsSite;
  final String summary;

  final String publishedAt;

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

  Blog.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        url = json['url'] as String,
        imageUrl = json['image_url'] as String,
        newsSite = json['news_site'] as String,
        summary = json['summary'] as String,
        publishedAt = json['published_at'] as String,
        updatedAt = json['updated_at'] as String,
        featured = json['featured'] as bool;
}
