part of '../user_profile_data.dart';

class _RegistrationData extends StatefulWidget {
  final VoidCallback onPressed;

  const _RegistrationData({Key key, this.onPressed}) : super(key: key);

  ///todo init state inside route function
  static Route route(VoidCallback onPressed) =>
      BaseRoute.route(_RegistrationData(onPressed: onPressed));

  @override
  __RegistrationDataState createState() => __RegistrationDataState();
}

class __RegistrationDataState extends State<_RegistrationData> {
  String get title => 'Регистрация';
  bool isSame = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: getProfileAppBar(context, title),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 12),
            const Text('Введите, пожалуйста данные о себе'),
            const SizedBox(height: 38),
            ProjectFormField(
              label: 'Ваш регион проживания',
              padding: EdgeInsets.zero,
            ),
            ProjectFormField(
              label: 'Город',
              padding: EdgeInsets.zero,
            ),
            ProjectFormField(
              label: 'Улица ',
              padding: EdgeInsets.zero,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: ProjectFormField(
                    label: 'Дом',
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: ProjectFormField(
                    label: 'Квартира',
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text('Адрес фактического проживания',
                style: theme.textTheme.headline2),
            SizedBox(
              height: 24,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('Совпадает с адресом регистрации'),
                    Checkbox(
                      value: isSame,
                      onChanged: (value) {
                        setState(() => isSame = value);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                if (!isSame) ...[
                  ProjectFormField(
                    label: 'Ваш регион проживания',
                    padding: EdgeInsets.zero,
                  ),
                  ProjectFormField(
                    label: 'Город',
                    padding: EdgeInsets.zero,
                  ),
                  ProjectFormField(
                    label: 'Улица ',
                    padding: EdgeInsets.zero,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        child: ProjectFormField(
                          label: 'Дом',
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        child: ProjectFormField(
                          label: 'Квартира',
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ] else ...[
                  SizedBox(
                    height: 11,
                  )
                ]
              ],
            ),
            MaterialButton(
              color: theme.primaryColor,
              onPressed: widget.onPressed,
              child: Center(
                child: Text(
                  'Далее',
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
