import 'package:flutter/material.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'package:vc_deca_web/navbar/about_navbar.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          AboutNavbar()
        ],
      ),
    );
  }
}
