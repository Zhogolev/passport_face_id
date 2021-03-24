import 'package:flutter/material.dart';

Widget getMainAppBar(
    {String title = 'Новый экран',
    List<Widget> actions = const [],
    PreferredSizeWidget bottom}) {
  return AppBar(
    title: Text(title),
    actions: actions,
    bottom: bottom,
  );
}
