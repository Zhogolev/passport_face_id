part of '../user_profile_data.dart';

class _InnData extends StatefulWidget {
  final VoidCallback onPressed;

  const _InnData({Key key, this.onPressed}) : super(key: key);

  static Route route(VoidCallback onPressed) =>
      BaseRoute.route(_InnData(onPressed: onPressed));

  @override
  _InnDataState createState() => _InnDataState();
}

class _InnDataState extends State<_InnData> {
  String get title => 'Ваш ИНН';
  bool isSame = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: getProfileAppBar(context, title),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 12),
            const Text('Введите, пожалуйста ваш ИНН'),
            const SizedBox(height: 60),
            ProjectFormField(
              padding: EdgeInsets.zero,
              label: 'ИНН',
              maxLength: 10,
            ),
            const SizedBox(height: 54),
            MaterialButton(
              color: theme.primaryColor,
              onPressed: widget.onPressed,
              child: Center(
                child: Text(
                  'Проверить',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ));
  }
}
