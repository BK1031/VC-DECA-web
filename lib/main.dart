import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vc_deca_web/pages/about_page.dart';
import 'package:vc_deca_web/pages/event_page.dart';
import 'package:vc_deca_web/pages/home/announcement_page.dart';
import 'package:vc_deca_web/pages/home/home_page.dart';
import 'package:vc_deca_web/pages/auth/login_page.dart';
import 'package:vc_deca_web/pages/auth/register_page.dart';
import 'package:vc_deca_web/pages/home/new_announcement_page.dart';
import 'package:vc_deca_web/pages/not_found_page.dart';
import 'package:vc_deca_web/pages/store_page.dart';
import 'package:vc_deca_web/pages/team_page.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'package:vc_deca_web/utils/service_account.dart';

void main() {
  initializeApp(
      apiKey: ServiceAccount.apiKey,
      authDomain: ServiceAccount.authDomain,
      databaseURL: ServiceAccount.databaseUrl,
      projectId: ServiceAccount.projectID,
      storageBucket: ServiceAccount.storageUrl
  );
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
    initialRoute: '/',
    onUnknownRoute: (RouteSettings setting) {
      String unknownRoute = setting.name;
      return new MaterialPageRoute(
          builder: (context) => NotFoundPage(unknownRoute)
      );
    },
    routes: {
      '/': (context) => new HomePage(),
      '/home': (context) => new HomePage(),
      '/home/announcements': (context) => new AnnouncementPage(),
      '/home/announcements/new': (context) => new NewAnnouncementPage(),
      '/about': (context) => new AboutPage(),
      '/team': (context) => new TeamPage(),
      '/events': (context) => new EventPage(),
      '/store': (context) => new StorePage(),
      '/login': (context) => new LoginPage(),
      '/register': (context) => new RegisterPage()
    },
  ));
}