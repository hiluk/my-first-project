import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:technical_dz/news/widgets/articles.dart';
import 'package:technical_dz/news/widgets/header_text.dart';

class ArticlesView extends ConsumerWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articlesNotifierProvider);
    final featuredArticles =
        articles.value!.where((article) => article.featured).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spaceflight News',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        const HeaderTextWidget(text: 'Articles'),
        ArticleWidget(
          articles: AsyncData(featuredArticles),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
