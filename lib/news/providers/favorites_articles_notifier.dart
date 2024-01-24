import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/core/providers/http_client_provider.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/views/articles_view.dart';

part 'favorites_articles_notifier.g.dart';

@riverpod
class FavoritesArticlesNotifier extends _$FavoritesArticlesNotifier {
  Dio get httpClient => ref.read(httpClientProvider);

  @override
  FutureOr<List<Article>> build() async {
    return [];
  }

  Future<Article> fetchFavoriteArticle(int id) async {
    final response = await httpClient.get('articles/$id');
    final data = response.data as Map<String, dynamic>;
    final article = Article.fromJson(data);
    return article;
  }

  void fetchFavoriteArticles() {
    final favoritesId = ref.watch(favoritesIdProvider);
    final favoritesArticles =
        favoritesId.map((id) => fetchFavoriteArticle(id)).toList();

    ref.notifyListeners();
  }
}
