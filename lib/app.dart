import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';
import 'data/repository/authentication/authentication_bloc.dart';
import 'data/repository/authentication/authentication_repository.dart';
import 'data/repository/authentication/authentication_repository_implementation.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl();

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: authenticationRepository)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AuthenticationBloc(authenticationRepository))
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          title: 'Business Application',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: _router.onGenerateRoute,
          builder: (_, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (_, state) {
                print('BlocListener app listen state $state');
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushNamedAndRemoveUntil(
                      AppRoute.home,
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushNamedAndRemoveUntil(
                      AppRoute.signIn,
                      (route) => false,
                    );
                    break;
                  default:
                    break;
                }
              },
              child: child,
            );
          },

        ),
      ),
    );
  }

  @override
  void dispose() {
    authenticationRepository.dispose();
    super.dispose();
  }
}

class SplashRoute extends StatelessWidget {
  static Route<void> route(RouteSettings settings) =>
      MaterialPageRoute(builder: (_) => SplashRoute());

  SplashRoute({Key key}) : super(key: key);

  @override
  Widget build(_) {
    return Material(
      child: Center(
        child: Text('Splash screen'),
      ),
    );
  }
}
