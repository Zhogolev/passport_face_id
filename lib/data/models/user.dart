import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class User extends Equatable {
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
  List<Object> get props => [username, password];
}
