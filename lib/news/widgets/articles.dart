import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/models/article.dart';
import 'package:technical_dz/news/widgets/title_widget.dart';

class ArticleWidget extends ConsumerWidget {
  final AsyncValue<List<Article>> articles;
  final String request;
  const ArticleWidget({
    super.key,
    required this.articles,
    required this.request,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: switch (articles) {
        AsyncData(:final value) => ListView(
            scrollDirection: Axis.vertical,
            children: [
              for (final article in value)
                InkWell(
                  onTap: () {
                    // launchUrl(Uri.parse(article.url));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 400,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            article.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        TitleWidget(
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
