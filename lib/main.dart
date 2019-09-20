import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vc_deca_web/pages/about_page.dart';
import 'package:vc_deca_web/pages/event_page.dart';
import 'package:vc_deca_web/pages/home_page.dart';
import 'package:vc_deca_web/pages/auth/login_page.dart';
import 'package:vc_deca_web/pages/auth/register_page.dart';
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
    routes: {
      '/': (context) => new HomePage(),
      '/about': (context) => new AboutPage(),
      '/team': (context) => new TeamPage(),
      '/events': (context) => new EventPage(),
      '/store': (context) => new StorePage(),
      '/login': (context) => new LoginPage(),
      '/register': (context) => new RegisterPage()
    },
  ));
}