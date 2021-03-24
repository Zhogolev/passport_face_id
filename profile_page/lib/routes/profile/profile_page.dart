import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../base/base_route.dart';
import '../main_app_bar.dart';
import '../main_navigation.dart';
import 'user_profile_data.dart';
import 'user_profile_statistic.dart';

final tabItemTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

class ProfilePage extends StatefulWidget implements SignedRoute {
  static Route route() {
    return BaseRoute.route(ProfilePage());
  }

  @override
  State<StatefulWidget> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  String get title => 'Профиль';
  TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabBar = TabBar(
      controller: _tabBarController,
      tabs: [
        Tab(
          child: Center(
            child: Text('Данные', style: tabItemTextStyle),
          ),
        ),
        Tab(
          child: Center(
            child: Text('Статистика', style: tabItemTextStyle),
          ),
        )
      ],
    );

    return SafeArea(
      child: Scaffold(
          drawer: getMainNavigationDrawer(context),
          appBar: getMainAppBar(title: title, bottom: tabBar),
          body: TabBarView(
            controller: _tabBarController,
            physics: NeverScrollableScrollPhysics(),
            children: [UserProfileData(), UserProfileStatistic()],
          )),
    );
  }
}
