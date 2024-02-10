import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/providers/favorites_articles_notifier.dart';
import 'package:technical_dz/news/routers/router.dart';
import 'package:technical_dz/news/widgets/article.dart';

@RoutePage()
class FavoriteArticlesView extends ConsumerWidget {
  final _scrollController = ScrollController();
  FavoriteArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArticles =
        ref.watch(favoritesArticlesNotifierProvider).valueOrNull ?? [];
    return (favoriteArticles.isEmpty)
        ? const Center(child: Text('Favorites is empty'))
        : Scaffold(
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
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: favoriteArticles.length,
                    (context, index) => ArticleWidget(
                      article: favoriteArticles[index],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
