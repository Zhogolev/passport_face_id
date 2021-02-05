import 'package:rxdart/subjects.dart';

import '../../models/user.dart';

abstract class AuthenticationRepository {
  BehaviorSubject<User> userSubject;
  
  void dispose();
  
  Future<User> loginWithUsernameAndPassword({String username, String password});

  Future<void> logOut();
}
