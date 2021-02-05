import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/authentication/authentication_bloc.dart';
import '../../base/base_route.dart';

class HomeRoute extends SignedRoute {
  static Route route() {
    return BaseRoute.route(HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(children: [
          Text('$runtimeType'),
          RaisedButton(onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested());
          })
        ]),
      ),
    );
  }
}
