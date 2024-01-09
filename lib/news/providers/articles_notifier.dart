import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/news/models/article.dart';

part 'articles_notifier.g.dart';

@riverpod
class ArticlesNotifier extends _$ArticlesNotifier {
  @override
  FutureOr<List<Article>> build() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.spaceflightnewsapi.net/v4/',
      ),
    );
    final response = await dio.get('articles');
    final data = response.data['results'] as List<dynamic>;
    final articles = data.map((e) => Article.fromJson(e)).toList();
    return articles;
  }
}
