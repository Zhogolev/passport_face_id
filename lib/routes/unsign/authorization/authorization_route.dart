import 'package:flutter/material.dart';

import '../../base/base_route.dart';

class AuthorizationRoute extends UnsignedRoute {
  static Route route() =>
      MaterialPageRoute(builder: (_) => AuthorizationRoute());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('authorization'),
    );
  }
}
