import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/models/articles_request.dart';
import 'package:technical_dz/news/models/blog.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:technical_dz/news/providers/blog_notifier.dart';
import 'package:technical_dz/news/widgets/article.dart';
import 'package:technical_dz/news/widgets/blogs.dart';
import 'package:technical_dz/news/widgets/search_field.dart';

final favoritesIdProvider = StateProvider<List<int>>((ref) => []);
final searchInputProvider = StateProvider<String>((ref) => '');

@RoutePage()
class ArticlesView extends HookConsumerWidget {
  final _scrollController = ScrollController();
  ArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesNotifier = ref.read(articlesNotifierProvider.notifier);
    final articles = ref.watch(articlesNotifierProvider).valueOrNull ?? [];
    final List<Blog> blogs = ref.watch(blogsNotifierProvider).valueOrNull ?? [];
    final textController = useTextEditingController();
    void controllerListener() {
      if (_scrollController.position.atEdge) {
        articlesNotifier.fetchNextPage(searchFieldText: textController.text);
      }
    }

    _scrollController.addListener(controllerListener);
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              textController: textController,
              onSearchPressed: (inputText) async {
                articlesNotifier.searchByParams(
                  request: ArticlesRequest(
                      titleContains: ref
                          .read(searchInputProvider.notifier)
                          .update((state) => inputText)),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Blogs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            BlogsWidget(blogs: blogs),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Articles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: articles
                  .map(
                    (article) => ArticleWidget(
                      article: article,
                      request: textController.text,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
