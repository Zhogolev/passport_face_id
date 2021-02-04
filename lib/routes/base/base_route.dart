import 'package:flutter/material.dart';

abstract class BaseRoute {
  /// Все руты равнозначны
  static Route route(Widget widget) {
    return MaterialPageRoute<void>(builder: (_) => widget);
  }
}

abstract class SignedRoute extends StatelessWidget {}

abstract class UnsignedRoute extends StatelessWidget {}
