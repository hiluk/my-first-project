import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/providers/favorites_provider.dart';

@RoutePage()
class FeatureArticlesView extends ConsumerWidget {
  const FeatureArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesIdNotifier =
        ref.read(favoritesArticleNotifierProvider.notifier);
    final favoritesId = ref.watch(favoritesArticleNotifierProvider);
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
      body: Center(
        child: ListView(
            children: favoritesId.map((e) => Text(e.toString())).toList()),
      ),
      // body: Column(
      //   children: [
      //     ArticleWidget(
      //       articles: articles,
      //     ),
      //   ],
      // ),
    );
  }
}
