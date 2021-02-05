import 'package:formz/formz.dart';

enum UsernameValidationError { invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([String value = '']) : super.dirty(value);

  static final RegExp _usernameRegExp = RegExp(
    r'[A-Za-z0-9\d]{8,}$',
  );

  @override
  UsernameValidationError validator(String value) {
    final valid = _usernameRegExp.hasMatch(value)
        ? null
        : UsernameValidationError.invalid;

    print('username field is valid: $valid');
    return valid;
  }
}
