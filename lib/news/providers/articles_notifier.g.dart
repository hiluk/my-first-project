// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_notifier.dart';

/// See also [ArticlesNotifier].
@ProviderFor(ArticlesNotifier)
final articlesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ArticlesNotifier, List<Article>>.internal(
  ArticlesNotifier.new,
  name: r'articlesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$articlesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articlesNotifierHash() => r'afcd9275cd7e098f07a74842a7f8d3d856eb92ee';

typedef _$ArticlesNotifier = AutoDisposeAsyncNotifier<List<Article>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
