import 'package:flutter/material.dart';

abstract class RegistrationPage extends StatelessWidget {
  final void Function() onSuccessSubmit;
  final void Function() onBack;

  const RegistrationPage({Key key, this.onSuccessSubmit, this.onBack})
      : super(key: key);

}
