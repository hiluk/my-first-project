import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/models/blog.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:technical_dz/news/providers/blog_notifier.dart';
import 'package:technical_dz/news/routers/router.dart';
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
    final List<Article> articles =
        ref.watch(articlesNotifierProvider).valueOrNull ?? [];
    final List<Blog> blogs = ref.watch(blogsNotifierProvider).valueOrNull ?? [];
    final textController = useTextEditingController();
    void controllerListener() {
      if (_scrollController.position.atEdge) {
        articlesNotifier.fetchNextPage(searchFieldText: textController.text);
      }
    }

    _scrollController.addListener(controllerListener);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: Text('SpaceFlight News'),
            centerTitle: true,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(
                    const UserProfileScreenRoute(),
                  );
                },
                icon: const Icon(Icons.person),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SearchField(textController: textController),
          ),
          BlogsWidget(blogs: blogs),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) => ArticleWidget(
                article: articles[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
