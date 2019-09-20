import 'package:flutter/material.dart';
import 'package:vc_deca_web/navbar/home_navbar.dart';
import 'package:vc_deca_web/utils/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          HomeNavbar(),
        ],
      ),
    );
  }
}
