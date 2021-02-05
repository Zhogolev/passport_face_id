import 'package:flutter/material.dart';

import '../../base/base_route.dart';

class HomeRoute extends SignedRoute {
  static Route route() {
    return BaseRoute.route(HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [Text('$runtimeType'), RaisedButton(onPressed: () {})]);
  }
}
