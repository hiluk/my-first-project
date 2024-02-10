import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/core/providers/http_client_provider.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/providers/user_data_notifier.dart';

part 'favorites_articles_notifier.g.dart';

@riverpod
class FavoritesArticlesNotifier extends _$FavoritesArticlesNotifier {
  final db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Dio get httpClient => ref.read(httpClientProvider);

  @override
  FutureOr<List<Article>> build() async {
    final userData = ref.watch(userDataProvider).valueOrNull;
    List<dynamic>? ids = userData!.favoriteIds ?? [];
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
    final userData = ref.watch(userDataProvider).valueOrNull;
    List<dynamic>? ids = userData!.favoriteIds ?? [];
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

  void setFavorite(int id) async {
    final userDataNotifier = ref.watch(userDataProvider.notifier);
    final userData = ref.watch(userDataProvider).valueOrNull;
    List<dynamic> newFavorites = userData!.copyWith().favoriteIds ?? [];
    if (newFavorites.contains(id)) {
      newFavorites.remove(id);
    } else {
      newFavorites.add(id);
    }
    userDataNotifier.setData(userData.copyWith(favoriteIds: newFavorites));
  }
}
