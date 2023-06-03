// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/main/main_page.dart' as _i2;
import '../../presentation/main/main_page_wrapper.dart' as _i1;

class Router extends _i3.RootStackRouter {
  Router([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainPageRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPageWrapper(),
      );
    },
    MainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          MainPageRouter.name,
          path: '/',
          children: [
            _i3.RouteConfig(
              MainRoute.name,
              path: '',
              parent: MainPageRouter.name,
            )
          ],
        )
      ];
}

/// generated route for
/// [_i1.MainPageWrapper]
class MainPageRouter extends _i3.PageRouteInfo<void> {
  const MainPageRouter({List<_i3.PageRouteInfo>? children})
      : super(
          MainPageRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainPageRouter';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}
