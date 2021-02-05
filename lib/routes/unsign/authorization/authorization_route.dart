import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/authentication/authentication_repository.dart';
import '../../base/base_route.dart';
import 'cubit/login_cubit.dart';
import 'view/login_form.dart';

class AuthorizationRoute extends UnsignedRoute {
  static Route route() =>
      MaterialPageRoute(builder: (_) => AuthorizationRoute());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: LoginForm(),
        ),
      ),
    );
  }
}
