import 'package:flutter/cupertino.dart';

class User {
  final String username;
  final String phone;
  final String password;
  final String id;

  const User(
      {@required this.username,
      @required this.phone,
      @required this.password,
      @required this.id});

  static const User unknown =
      User(id: '', phone: '', password: '', username: '');

  @override
  bool operator ==(Object other) =>
      other is User &&
      other.password == other.password &&
      other.username == other.username;

  @override
  int get hashCode => super.hashCode;
}
