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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArticlesView(),
      );
    },
    FeatureArticlesViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeatureArticlesView(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [ArticlesView]
class ArticlesViewRoute extends PageRouteInfo<void> {
  const ArticlesViewRoute({List<PageRouteInfo>? children})
      : super(
          ArticlesViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeatureArticlesView]
class FeatureArticlesViewRoute extends PageRouteInfo<void> {
  const FeatureArticlesViewRoute({List<PageRouteInfo>? children})
      : super(
          FeatureArticlesViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeatureArticlesViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
