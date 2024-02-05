import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/screens.dart/home_screen.dart';
import 'package:technical_dz/news/screens.dart/sign_in_screen.dart';
import 'package:technical_dz/news/screens.dart/sign_up_screen.dart';
import 'package:technical_dz/news/screens.dart/user_profile_screen.dart';
import 'package:technical_dz/news/views/articles_view.dart';
import 'package:technical_dz/news/views/favorites_view.dart';

part 'router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(
  replaceInRouteName: 'View, Page, Route',
)
class AppRouter extends _$AppRouter {
  final user = FirebaseAuth.instance.currentUser;
  final authState = FirebaseAuth.instance.authStateChanges().listen(
    (User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    },
  );
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInScreenRoute.page,
          initial: (user == null) ? true : false,
        ),
        AutoRoute(
          page: SignUpScreenRoute.page,
        ),
        AutoRoute(
          page: UserProfileScreenRoute.page,
        ),
        AutoRoute(
          page: HomeScreenRoute.page,
          initial: (user != null) ? true : false,
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
