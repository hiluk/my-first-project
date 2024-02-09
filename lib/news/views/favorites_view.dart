import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/providers/favorites_articles_notifier.dart';
import 'package:technical_dz/news/widgets/article.dart';

@RoutePage()
class FavoriteArticlesView extends ConsumerWidget {
  const FavoriteArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArticles =
        ref.watch(favoritesArticlesNotifierProvider).valueOrNull ?? [];
    return (favoriteArticles.isEmpty)
        ? const Center(child: Text('Favorites is empty'))
        : ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(article: favoriteArticles[index]);
            },
          );
  }
}
