import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';

import 'app.dart';
import 'routes/sign/home/home_page.dart';
import 'routes/unsign/authorization/authorization_route.dart';
import 'routes/unsign/registation/registration_route.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.signIn:
        return AuthorizationRoute.route();
      case AppRoute.signUp:
        return RegistrationRoute.route();
      case AppRoute.home:
        return HomeRoute.route();
    }

    return SplashRoute.route(settings);
  }
}

abstract class AppRoute {
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String initial = '/';
  static const String splash = '/splash';
  static const String home = '/home';
}
