import '../../models/user.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  List<User> users = [
    User(username: 'testuser', phone: '+7 999 999 99 76', password: 'test')
  ];

  @override
  Future<User> loginWithUsernameAndPassword(
      {String username, String password}) {
    return Future.delayed(Duration(seconds: 3), () {
      final curUser = User(username: username, password: password);
      if (users.contains(User(username: username, password: password))) {
        return users.firstWhere((user) => curUser == user);
      } else {
        throw Exception();
      }
    });
  }
}
