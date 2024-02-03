import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/http_client_provider.dart';

part 'news_sites_provider.g.dart';

@riverpod
class NewsSites extends _$NewsSites {
  Dio get httpClient => ref.read(httpClientProvider);

  @override
  Future<List<String>> build() async {
    final response = await httpClient.get('info');
    final data = response.data["news_sites"] as List<dynamic>;
    final newsSites = data.map((e) => e.toString()).toList();
    return newsSites;
  }
}
