import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:technical_dz/news/providers/favorites_articles_notifier.dart';
import 'package:technical_dz/news/widgets/highlight_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final favoriteArticlesNotifier =
        ref.watch(favoritesArticlesNotifierProvider.notifier);
    final favoriteArticles =
        ref.watch(favoritesArticlesNotifierProvider).valueOrNull;
    // final MyUser? userData = ref.watch(userDataProvider).valueOrNull;
    final articlesNotifier = ref.read(articlesNotifierProvider.notifier);
    // List<dynamic>? favoriteIds = userData!.favoriteIds ?? [];
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
                  onTap: () {
                    launchUrl(
                      Uri.parse(article.url),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              favoriteArticlesNotifier.setFavorite(article.id);
                            },
                            icon: favoriteArticles!.contains(article)
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
                        Text(article.newsSite),
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
