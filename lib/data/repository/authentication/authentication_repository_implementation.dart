import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/user.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  User _currentUser = User.unknown;

  AuthenticationRepositoryImpl() {
    if (kDebugMode) {
      print('AuthenticationRepositoryImpl.constructor');
    }
  }

  List<User> users = [
    User(
        username: 'test123',
        phone: '+7 999 999 99 76',
        password: 'test123',
        id: '1')
  ];

  @override
  Future<User> loginWithUsernameAndPassword(
      {String username, String password}) {
    return Future.delayed(Duration(seconds: 3), () {
      final curUser =
          User(username: username, password: password, phone: '', id: '');
      if (users.contains(User(
        username: username,
        password: password,
        id: '',
        phone: '',
      ))) {
        _currentUser = users.firstWhere((user) => curUser == user);
        userSubject.add(_currentUser ?? User.unknown);
        return _currentUser;
      } else {
        throw Exception();
      }
    });
  }

  @override
  BehaviorSubject<User> userSubject =
      BehaviorSubject<User>.seeded(User.unknown, onListen: () {
    print('add new listener');
  });

  @override
  void dispose() {
    userSubject.close();
  }

  @override
  Future<void> logOut() async {
    _currentUser = User.unknown;
    userSubject.add(_currentUser);
  }
}
