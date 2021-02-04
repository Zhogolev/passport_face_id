import 'package:flutter/material.dart';

import '../../base/base_route.dart';

class HomePage extends SignedRoute {
  static Route route() {
    return BaseRoute.route(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [Text('$runtimeType'), RaisedButton(onPressed: () {})]);
  }
}
