import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/models/articles_request.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:technical_dz/news/widgets/articles.dart';
import 'package:technical_dz/news/widgets/header_text.dart';
import 'package:technical_dz/news/widgets/search_field.dart';

final searchInputProvider = StateProvider<String>((ref) => '');

class ArticlesView extends ConsumerWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesNotifier = ref.read(articlesNotifierProvider.notifier);
    final articles = ref.watch(articlesNotifierProvider);
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => print(searchText),
      // ),
      body: Column(
        children: [
          SearchField(
            onSearchPressed: (inputText) async {
              articlesNotifier.searchByParams(
                request: ArticlesRequest(
                    titleContains: ref
                        .read(searchInputProvider.notifier)
                        .update((state) => inputText)),
              );
            },
          ),
          const HeaderTextWidget(text: 'Articles'),
          ArticleWidget(
            articles: articles,
            request: ref.watch(searchInputProvider),
          ),
        ],
      ),
    );
  }
}
