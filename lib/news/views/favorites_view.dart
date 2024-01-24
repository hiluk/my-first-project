import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/providers/favorites_articles_notifier.dart';
import 'package:technical_dz/news/widgets/articles.dart';

@RoutePage()
class FeatureArticlesView extends ConsumerWidget {
  const FeatureArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesArticles = ref.watch(favoritesArticlesNotifierProvider);
    return Scaffold(
      body: Column(
        children: [
          ArticleWidget(
            articles: favoritesArticles,
          ),
        ],
      ),
    );
  }
}
