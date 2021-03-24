import 'package:flutter/material.dart';

PreferredSizeWidget getProfileAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_outlined,
      ),
      onPressed: Navigator.of(context).pop,
    ),
    title: Text(title),
  );
}
