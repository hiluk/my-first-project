import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:technical_dz/news/widgets/articles.dart';

@RoutePage()
class FeatureArticlesView extends ConsumerWidget {
  const FeatureArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articlesNotifierProvider);
    final featuredArticles =
        articles.value!.where((article) => article.featured).toList();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Spaceflight News',
      //     style: TextStyle(
      //       fontSize: 18,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: featuredArticles.isEmpty
          ? const Center(
              child: Text(
                'Favorites is empty',
              ),
            )
          : Column(
              children: [
                ArticleWidget(
                  articles: AsyncData(featuredArticles),
                ),
              ],
            ),
    );
  }
}
