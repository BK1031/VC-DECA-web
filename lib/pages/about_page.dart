import 'package:flutter/material.dart';
import 'package:vc_deca_web/navbar/home_navbar.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'dart:html' as html;

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          HomeNavbar()
        ],
      ),
    );
  }
}
