import 'package:flutter/material.dart';

import '../../base/base_route.dart';

class RegistrationRoute extends UnsignedRoute {
  static Route route() =>
      MaterialPageRoute(builder: (_) => RegistrationRoute());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('registration'),
    );
  }
}
