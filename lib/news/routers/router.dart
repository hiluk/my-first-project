import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/screens.dart/home_screen.dart';
import 'package:technical_dz/news/screens.dart/sign_in_screen.dart';
import 'package:technical_dz/news/screens.dart/sign_up_screen.dart';
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
          page: SignInScreenRoute.page,
          initial: true,
          keepHistory: false,
        ),
        AutoRoute(
          page: SignUpScreenRoute.page,
        ),
        AutoRoute(
          page: HomeScreenRoute.page,
          children: [
            AutoRoute(
              page: ArticlesViewRoute.page,
            ),
            AutoRoute(
              page: FavoriteArticlesViewRoute.page,
            ),
          ],
        ),
      ];
}
