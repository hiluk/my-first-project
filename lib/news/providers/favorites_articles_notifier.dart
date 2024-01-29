import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/core/providers/http_client_provider.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/providers/favorites_provider.dart';

part 'favorites_articles_notifier.g.dart';

@riverpod
class FavoritesArticlesNotifier extends _$FavoritesArticlesNotifier {
  Dio get httpClient => ref.read(httpClientProvider);

  @override
  FutureOr<List<Article>> build() async {
    return fetchFavoriteArticles();
  }

  Future<dynamic> fetchDataById(int id) async {
    try {
      final response = await httpClient.get('articles/$id/');
      final data = response.data as Map<String, dynamic>;
      return data;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<List<Article>> fetchFavoriteArticles() async {
    final ids = ref.watch(favoritesNotifierProvider).valueOrNull;
    if (ids == null) return [];
    final datas = await Future.wait(
      ids.map(
        (id) => fetchDataById(id),
      ),
    );
    final favoriteArticles = datas.map((data) {
      return Article.fromJson(data);
    }).toList();
    return favoriteArticles;
  }
}
