part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.password = const Password.pure(),
    this.username = const Username.pure(),
    this.status = FormzStatus.pure,
  });

  final Password password;
  final FormzStatus status;
  final Username username;

  @override
  List<Object> get props => [username, password, status];

  LoginState copyWith({
    Username username,
    Password password,
    FormzStatus status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
