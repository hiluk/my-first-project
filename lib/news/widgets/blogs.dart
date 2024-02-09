import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/models/blog.dart';
import 'package:technical_dz/news/providers/blog_notifier.dart';

class BlogsWidget extends HookConsumerWidget {
  final List<Blog> blogs;
  final _scrollController = ScrollController();

  BlogsWidget({
    super.key,
    required this.blogs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogsNotifier = ref.watch(blogsNotifierProvider.notifier);
    void controllerListener() {
      if (_scrollController.position.atEdge) {
        blogsNotifier.fetchNextPage();
      }
    }

    _scrollController.addListener(controllerListener);
    return SizedBox(
      height: 300,
      // color: Colors.red,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    width: 300,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          blogs[index].imageUrl,
                          maxHeight: 500,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: blogs.length,
      ),
    );
  }
}
