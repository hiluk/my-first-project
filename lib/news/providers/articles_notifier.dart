import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/core/providers/http_client_provider.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/models/articles_request.dart';

part 'articles_notifier.g.dart';

@riverpod
class ArticlesNotifier extends _$ArticlesNotifier {
  Dio get httpClient => ref.read(httpClientProvider);

  @override
  FutureOr<List<Article>> build() async {
    return fetchArticles();
  }

  Future<List<Article>> fetchArticles([ArticlesRequest? request]) async {
    final response = await httpClient.get(
      'articles',
      queryParameters: request?.toJson(),
    );
    final data = response.data['results'] as List<dynamic>;
    final articles = data.map((e) => Article.fromJson(e)).toList();
    return articles;
  }

  Future<void> fetchNextPage(String searchField) async {
    if (state.value == null) return;
    final response = await fetchArticles(
      ArticlesRequest(
        offset: state.value!.length + 20,
        titleContains: searchField,
      ),
    );
    final list = state.value!;
    list.addAll(response);
    state = AsyncData(list);
  }

  Future<void> searchByParams({ArticlesRequest? request}) async {
    state = const AsyncValue.loading();
    state = AsyncData(await fetchArticles(request));
  }
}
