import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_router.dart';
import '../../data/repository/authentication/authentication_bloc.dart';

TextStyle inactiveTextStyle = GoogleFonts.roboto(
    decoration: TextDecoration.lineThrough, fontWeight: FontWeight.w500);
TextStyle activeTextStyle = GoogleFonts.roboto(fontWeight: FontWeight.w500);

Drawer getMainNavigationDrawer(BuildContext context) {
  void navigate(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
  }

  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        //todo header
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              minRadius: 30,
              maxRadius: 30,
              child: Center(child: Icon(Icons.person_outline_rounded)),
            ),
            Text(
              'Иванов Иван Иваныч',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            Text(
              '+7 (999) 244-23-42',
              style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            )
          ],
        ),
      ),
      ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Главная',
            style: activeTextStyle,
          ),
          onTap: () => navigate(AppRoute.home)),
      ListTile(
        leading: Icon(Icons.search),
        title: Text(
          'Поиск',
          style: inactiveTextStyle,
        ),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.payments),
        title: Text(
          'Выплаты',
          style: inactiveTextStyle,
        ),
        onTap: () {},
      ),
      ListTile(
          leading: Icon(Icons.portrait_rounded),
          title: Text(
            'Профиль',
            style: activeTextStyle,
          ),
          onTap: () => navigate(AppRoute.profile)),
      ListTile(
        leading: Icon(Icons.cast_for_education),
        title: Text(
          'Инструктаж',
          style: inactiveTextStyle,
        ),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.notifications_active_rounded),
        trailing: Text('28'),
        title: Text(
          'Уведомления',
          style: inactiveTextStyle,
        ),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.help_outline),
        title: Text(
          'Помощь',
          style: inactiveTextStyle,
        ),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text(
          'Настройки',
          style: inactiveTextStyle,
        ),
        onTap: () {},
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text(
          'Выйти',
          style: activeTextStyle,
        ),
        onTap: () {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationLogoutRequested());
        },
      ),
      SizedBox(
        height: 15,
      )
    ],
  ));
}
