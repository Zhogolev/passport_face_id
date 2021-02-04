import '../../models/user.dart';

abstract class AuthenticationRepository {
  Future<User> loginWithUsernameAndPassword({String username, String password});
}
