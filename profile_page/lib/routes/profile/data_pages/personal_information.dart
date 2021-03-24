part of '../user_profile_data.dart';

class _BaseInformationPage extends StatelessWidget {
  _BaseInformationPage({Key key, this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  ///todo init state inside route function
  static Route route() => BaseRoute.route(_BaseInformationPage(onPressed: (){
    ///todo dont forget to add saving statement

  },));

  String get title => 'Персональные данные';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<String> countries = ['Российская Федерация'];
    List<Sex> sexes = [Sex.male, Sex.female];
    String country = countries.first;
    Sex sex = Sex.male;

    ThemeData themeData = Theme.of(context);

    ///todo add save
    return Scaffold(
      appBar: getProfileAppBar(context, title),
      body: ListView(
        padding: bodyPadding,
        children: [
          const SizedBox(height: 12),
          const Text('Введите, пожалуйста данные о себе'),
          const SizedBox(height: 38),
          StatefulBuilder(
            builder: (context, setState) => DropdownButtonFormField(
              value: country,
              decoration: InputDecoration(
                  labelText: 'Гражданство',
                  labelStyle: themeData.textTheme.bodyText2
                      .copyWith(color: Colors.black.withAlpha(150))),
              items: countries
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: themeData.textTheme.headline5,
                        ),
                      ))
                  .toList(),
              onChanged: (val) => setState(() => country = val),
            ),
          ),
          ProjectFormField(
            label: 'Фамилия',
          ),
          ProjectFormField(
            label: 'Имя',
          ),
          ProjectFormField(
            label: 'Отчество',
          ),
          const SizedBox(height: 12),
          StatefulBuilder(
            builder: (_, setState) => RadioGroup<Sex>.builder(
              itemBuilder: (value) {
                return RadioButtonBuilder(
                    value == Sex.male ? 'Мужчина' : 'Женщина',
                    textPosition: RadioButtonTextPosition.left);
              },
              direction: Axis.horizontal,
              horizontalAlignment: MainAxisAlignment.start,
              items: sexes,
              groupValue: sex,
              onChanged: (value) {
                setState(() => sex = value);
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 35,
            width: 105,
            child: MaterialButton(
              color: theme.primaryColor,
              onPressed: onPressed ?? () {},
              child: Center(
                child: Text(
                  'Сохранить',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
