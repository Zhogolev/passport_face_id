part of '../user_profile_data.dart';

class _MedicalBookData extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final VoidCallback onPressed;

  static Route route(VoidCallback onPressed) => BaseRoute.route(_MedicalBookData(onPressed: () {
    ///todo save
    print('///todo save data');
  }));

  _MedicalBookData({Key key, @required this.onPressed}) : super(key: key);

  String get title => 'Медецинская книжка';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: getProfileAppBar(context, title),
      body: ListView(
        padding: bodyPadding,
        children: [
          const SizedBox(height: 12),
          const Text('Введите, пожалуйста данные о себе'),
          const SizedBox(height: 38),
          ProjectFormField(
            padding: EdgeInsets.zero,
            label: 'Код и серия паспорта',
          ),
          ProjectFormField(
            padding: EdgeInsets.zero,
            label: 'Дата выдачи паспорта',
            hint: '12/12/2020',
          ),
          ProjectFormField(
            padding: EdgeInsets.zero,
            label: 'Кем выдан',
          ),
          ProjectFormField(
            padding: EdgeInsets.zero,
            label: 'Код подразделения',
          ),
          const SizedBox(height: 24),
          MaterialButton(
            color: theme.primaryColor,
            onPressed: () async {
              final pickedMainPage =
              await _picker.getImage(source: ImageSource.camera);
            },
            child: Text(
              'Первая страница паспорта',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: theme.primaryColor,
            onPressed: () async {
              final pickedFile =
              await _picker.getImage(source: ImageSource.camera);
            },
            child: Text('Фото паспорта в руках',
                style: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 24,
          ),
          MaterialButton(
            color: theme.primaryColor,
            onPressed: onPressed ?? () {},
            child: Center(
              child: Text(
                'Сохранить',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
