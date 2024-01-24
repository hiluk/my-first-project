import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:technical_dz/news/providers/favorites_provider.dart';
import 'package:technical_dz/news/widgets/highlight_widget.dart';

class ArticleWidget extends ConsumerWidget {
  final AsyncValue<List<Article>> articles;
  final String request;
  final _scrollController = ScrollController();

  ArticleWidget({
    super.key,
    this.request = '',
    required this.articles,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesIdNotifier = ref.read(favoritesNotifierProvider.notifier);
    final favoritesId = ref.watch(favoritesNotifierProvider);
    final articlesNotifier = ref.read(articlesNotifierProvider.notifier);
    void controllerListener() {
      if (_scrollController.position.atEdge) {
        articlesNotifier.fetchNextPage(request);
      }
    }

    _scrollController.addListener(controllerListener);
    return Flexible(
      child: switch (articles) {
        AsyncData(:final value) => ListView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            children: [
              for (var article in value)
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              favoritesIdNotifier.setFavorite(article.id);
                            },
                            icon: favoritesId.contains(article.id)
                                ? const Icon(Icons.bookmark_added)
                                : const Icon(Icons.bookmark_add),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            maxHeight: 400,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            article.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        HighlightWidget(
                          text: article.title,
                          request: request,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            article.summary,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
