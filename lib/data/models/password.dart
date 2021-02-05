import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp =
  RegExp(r'[A-Za-z0-9\d]{8,}$');

  @override
  PasswordValidationError validator(String value) {
    final valid = _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;

    print('password field is valid: $valid');
    return valid;
  }
}
