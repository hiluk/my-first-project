import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/screen.dart/home_screen.dart';
import 'package:technical_dz/news/views/articles_view.dart';
import 'package:technical_dz/news/views/favorites_view.dart';

part 'router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(
  replaceInRouteName: 'View, Page, Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeScreenRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: ArticlesViewRoute.page,
            ),
            AutoRoute(
              page: FeatureArticlesViewRoute.page,
            ),
          ],
        ),
      ];
}
