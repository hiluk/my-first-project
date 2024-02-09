import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/providers/favorites_articles_notifier.dart';
import 'package:technical_dz/news/widgets/highlight_widget.dart';

class ArticleWidget extends ConsumerWidget {
  final Article article;
  final String request;

  const ArticleWidget({
    super.key,
    required this.article,
    this.request = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArticlesNotifier =
        ref.read(favoritesArticlesNotifierProvider.notifier);
    final favoriteArticles =
        ref.watch(favoritesArticlesNotifierProvider).valueOrNull;
    return InkWell(
      onTap: () {
        // launchUrl(
        //   Uri.parse(article.url),
        //   mode: LaunchMode.inAppWebView,
        // );
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
                icon: Icon(favoriteArticles!.contains(article)
                    ? Icons.bookmark_added
                    : Icons.bookmark_add),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxHeight: 300,
                minWidth: double.infinity,
              ),
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                memCacheHeight: 700,
                memCacheWidth: 900,
                key: UniqueKey(),
                imageUrl: article.imageUrl,
                fit: BoxFit.cover,
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
    );
  }
}
