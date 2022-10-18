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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../presentation/auth-screen/auth_screen.dart' as _i2;
import '../presentation/home-screen/home_screen.dart' as _i3;
import '../presentation/splash-screen/splash_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          SplashScreen.name,
          path: 'splash',
        ),
        _i4.RouteConfig(
          AuthScreen.name,
          path: 'auth',
        ),
        _i4.RouteConfig(
          HomeScreen.name,
          path: 'home',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: 'splash',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthScreen extends _i4.PageRouteInfo<void> {
  const AuthScreen()
      : super(
          AuthScreen.name,
          path: 'auth',
        );

  static const String name = 'AuthScreen';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: 'home',
        );

  static const String name = 'HomeScreen';
}
