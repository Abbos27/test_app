import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/app.dart';
import 'package:test_app/features/auth/presentation/pages/login_page.dart';
import 'package:test_app/features/favorites/presentation/pages/favourites_page.dart';
import 'package:test_app/features/feed/presentation/pages/feed_page.dart';
import 'package:test_app/features/home/presentation/pages/home/home_page.dart';
import 'package:test_app/features/map/presentation/pages/map_page.dart';
import 'package:test_app/features/profile/presentation/pages/profile_page.dart';
import 'package:test_app/injector_container.dart';
import 'package:test_app/routes/guards/auth_guard.dart';

part 'app_router.gr.dart';

class AppRoutes {
  AppRoutes._();

  static const home = '/';
  static const login = '/login';
  static const feed = 'feed';
  static const map = 'map';
  static const favourites = 'favourites';
  static const profile = 'profile';
}

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: AppRoutes.home,
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: AppRoutes.feed,
              page: FeedRoute.page,
            ),
            AutoRoute(
              path: AppRoutes.map,
              page: MapRoute.page,
            ),
            AutoRoute(
              path: AppRoutes.favourites,
              page: FavouritesRoute.page,
            ),
            AutoRoute(
              path: AppRoutes.profile,
              page: ProfileRoute.page,
            ),
          ],
          guards: [
            sl<AuthGuard>(),
          ],
        ),
        AutoRoute(
          path: AppRoutes.login,
          page: LoginRoute.page,
        ),
        RedirectRoute(
          path: '*',
          redirectTo: AppRoutes.home,
        ),
      ];
}
