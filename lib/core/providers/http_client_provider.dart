import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_client_provider.g.dart';

@riverpod
Dio httpClient(HttpClientRef ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.spaceflightnewsapi.net/v4/',
    ),
  );
}
