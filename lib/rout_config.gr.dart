// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:scaffold/features/myFeatureName/presentation/pages/details_page.dart'
    as _i2;
import 'package:scaffold/features/myFeatureName/presentation/pages/home_page.dart'
    as _i3;
import 'package:scaffold/features/myFeatureName/presentation/pages/tab_one.dart'
    as _i4;
import 'package:scaffold/features/myFeatureName/presentation/pages/tab_three.dart'
    as _i5;
import 'package:scaffold/features/myFeatureName/presentation/pages/tab_two.dart'
    as _i1;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    TabTwoRoute.name: (routeData) {
      final args = routeData.argsAs<TabTwoRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.TabTwoScreen(
          args.title,
          key: args.key,
        ),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailsScreen(
          args.title,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(key: args.key),
      );
    },
    TabOneRoute.name: (routeData) {
      final args = routeData.argsAs<TabOneRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.TabOneScreen(
          args.title,
          key: args.key,
        ),
      );
    },
    TabThreeRoute.name: (routeData) {
      final args = routeData.argsAs<TabThreeRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.TabThreeScreen(
          args.title,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.TabTwoScreen]
class TabTwoRoute extends _i6.PageRouteInfo<TabTwoRouteArgs> {
  TabTwoRoute({
    required String title,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TabTwoRoute.name,
          args: TabTwoRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TabTwoRoute';

  static const _i6.PageInfo<TabTwoRouteArgs> page =
      _i6.PageInfo<TabTwoRouteArgs>(name);
}

class TabTwoRouteArgs {
  const TabTwoRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final _i7.Key? key;

  @override
  String toString() {
    return 'TabTwoRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [_i2.DetailsScreen]
class DetailsRoute extends _i6.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required String title,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const _i6.PageInfo<DetailsRouteArgs> page =
      _i6.PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final _i7.Key? key;

  @override
  String toString() {
    return 'DetailsRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<HomeRouteArgs> page =
      _i6.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.TabOneScreen]
class TabOneRoute extends _i6.PageRouteInfo<TabOneRouteArgs> {
  TabOneRoute({
    required String title,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TabOneRoute.name,
          args: TabOneRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TabOneRoute';

  static const _i6.PageInfo<TabOneRouteArgs> page =
      _i6.PageInfo<TabOneRouteArgs>(name);
}

class TabOneRouteArgs {
  const TabOneRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final _i7.Key? key;

  @override
  String toString() {
    return 'TabOneRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [_i5.TabThreeScreen]
class TabThreeRoute extends _i6.PageRouteInfo<TabThreeRouteArgs> {
  TabThreeRoute({
    required String title,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TabThreeRoute.name,
          args: TabThreeRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TabThreeRoute';

  static const _i6.PageInfo<TabThreeRouteArgs> page =
      _i6.PageInfo<TabThreeRouteArgs>(name);
}

class TabThreeRouteArgs {
  const TabThreeRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final _i7.Key? key;

  @override
  String toString() {
    return 'TabThreeRouteArgs{title: $title, key: $key}';
  }
}
