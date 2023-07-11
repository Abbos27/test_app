import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/routes/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthService authService;

  AuthGuard(this.authService);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!authService.isAuthenticated) {
      resolver.redirect(LoginRoute(onLoginResult: (success) {
        resolver.next(success);
      }));
      return;
    }
    resolver.next(true);
  }
}

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}
