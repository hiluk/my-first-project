// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [ArticlesView]
class ArticlesViewRoute extends PageRouteInfo<void> {
  static const String name = 'ArticlesViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);

  const ArticlesViewRoute({List<PageRouteInfo>? children})
      : super(
          ArticlesViewRoute.name,
          initialChildren: children,
        );
}

/// generated route for
/// [FavoriteArticlesView]
class FavoriteArticlesViewRoute extends PageRouteInfo<void> {
  static const String name = 'FavoriteArticlesViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);

  const FavoriteArticlesViewRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteArticlesViewRoute.name,
          initialChildren: children,
        );
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  static const String name = 'HomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);

  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  static const String name = 'SignInScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);

  const SignInScreenRoute({List<PageRouteInfo>? children})
      : super(
          SignInScreenRoute.name,
          initialChildren: children,
        );
}

/// generated route for
/// [SignUpScreen]
class SignUpScreenRoute extends PageRouteInfo<void> {
  static const String name = 'SignUpScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);

  const SignUpScreenRoute({List<PageRouteInfo>? children})
      : super(
          SignUpScreenRoute.name,
          initialChildren: children,
        );
}

/// generated route for
/// [UserProfileScreen]
class UserProfileScreenRoute extends PageRouteInfo<void> {
  static const String name = 'UserProfileScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);

  const UserProfileScreenRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileScreenRoute.name,
          initialChildren: children,
        );
}

abstract class _$AppRouter extends RootStackRouter {
  @override
  final Map<String, PageFactory> pagesMap = {
    ArticlesViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticlesView(),
      );
    },
    FavoriteArticlesViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteArticlesView(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    SignInScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    UserProfileScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfileScreen(),
      );
    },
  };

  // ignore: unused_element
  _$AppRouter({super.navigatorKey});
}
