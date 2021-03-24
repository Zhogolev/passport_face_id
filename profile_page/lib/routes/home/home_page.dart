import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/authentication/authentication_bloc.dart';
import '../../base/base_route.dart';
import '../main_app_bar.dart';
import '../main_navigation.dart';

class HomeRoute extends StatelessWidget implements SignedRoute {
  static Route route() {
    return BaseRoute.route(HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: getMainNavigationDrawer(context),
        appBar: getMainAppBar(title: 'Смены'),
        body: Center(
          child: Column(children: [
            Text('$runtimeType'),
            RaisedButton(onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            },
            child: Text('Log out'),)
          ]),
        ),
      ),
    );
  }
}
