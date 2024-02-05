import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/core/providers/http_client_provider.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/models/my_user.dart';
import 'package:technical_dz/news/providers/user_data_notifier.dart';

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
    final userData = ref.watch(userDataProvider).valueOrNull;
    List<int>? ids = userData!.favoriteIds ?? [];
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
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser!;
    final userDataNotifier = ref.read(userDataProvider.notifier);
    final userData = ref.watch(userDataProvider).valueOrNull;
    final List<int> favoriteIds = [...userData!.favoriteIds!];
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
    final data = MyUser(
      email: userData.email,
      password: userData.password,
      uid: userData.uid,
      bio: userData.bio,
      createdAt: userData.createdAt,
      favoriteIds: favoriteIds,
      name: userData.name,
      phoneNumber: userData.phoneNumber,
    );
    userDataNotifier.updateDataToFirebase(data.toJson(), 'users', user.uid);
  }
}
