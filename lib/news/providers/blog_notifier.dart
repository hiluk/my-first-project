import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/core/providers/http_client_provider.dart';
import 'package:technical_dz/news/models/articles_request.dart';
import 'package:technical_dz/news/models/blog.dart';

part 'blog_notifier.g.dart';

@riverpod
class BlogsNotifier extends _$BlogsNotifier {
  Dio get httpClient => ref.read(httpClientProvider);

  @override
  FutureOr<List<Blog>> build() async {
    return fetchBlogs();
  }

  Future<List<Blog>> fetchBlogs([ArticlesRequest? request]) async {
    final response = await httpClient.get(
      'blogs',
      queryParameters: request?.toJson(),
    );
    final data = response.data['results'] as List<dynamic>;
    final blogs = data.map((e) => Blog.fromJson(e)).toList();
    return blogs;
  }

  Future<void> fetchNextPage() async {
    if (state.value == null) return;
    final response = await fetchBlogs(
      ArticlesRequest(
        offset: state.value!.length + 20,
      ),
    );
    final list = state.value!;
    list.addAll(response);
    state = AsyncData(list);
  }

  Future<void> searchByParams({ArticlesRequest? request}) async {
    state = const AsyncValue.loading();
    state = AsyncData(await fetchBlogs(request));
  }
}
