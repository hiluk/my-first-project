// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ArticlesViewRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesViewRouteArgs>(
          orElse: () => const ArticlesViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticlesView(key: args.key),
      );
    },
    FavoriteArticlesViewRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteArticlesViewRouteArgs>(
          orElse: () => const FavoriteArticlesViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FavoriteArticlesView(key: args.key),
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
}

/// generated route for
/// [ArticlesView]
class ArticlesViewRoute extends PageRouteInfo<ArticlesViewRouteArgs> {
  ArticlesViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ArticlesViewRoute.name,
          args: ArticlesViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ArticlesViewRoute';

  static const PageInfo<ArticlesViewRouteArgs> page =
      PageInfo<ArticlesViewRouteArgs>(name);
}

class ArticlesViewRouteArgs {
  const ArticlesViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ArticlesViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FavoriteArticlesView]
class FavoriteArticlesViewRoute
    extends PageRouteInfo<FavoriteArticlesViewRouteArgs> {
  FavoriteArticlesViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FavoriteArticlesViewRoute.name,
          args: FavoriteArticlesViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FavoriteArticlesViewRoute';

  static const PageInfo<FavoriteArticlesViewRouteArgs> page =
      PageInfo<FavoriteArticlesViewRouteArgs>(name);
}

class FavoriteArticlesViewRouteArgs {
  const FavoriteArticlesViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FavoriteArticlesViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute({List<PageRouteInfo>? children})
      : super(
          SignInScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpScreenRoute extends PageRouteInfo<void> {
  const SignUpScreenRoute({List<PageRouteInfo>? children})
      : super(
          SignUpScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfileScreen]
class UserProfileScreenRoute extends PageRouteInfo<void> {
  const UserProfileScreenRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
