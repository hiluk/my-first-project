import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/providers/articles_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:technical_dz/repository/news_cards.dart';

class ArticlesView extends ConsumerWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: double.infinity,
              ),
              width: double.infinity,
              child: const Text(
                'Articles',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Flexible(
            child: switch (articles) {
              AsyncData(:final value) => ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    for (final article in value)
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(article.url));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  child: Image.network(article.imageUrl),
                                ),
                              ),
                              Text(
                                article.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(article.summary),
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
          ),
        ],
      ),
    );
  }
}
