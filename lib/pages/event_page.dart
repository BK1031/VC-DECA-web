import 'package:flutter/material.dart';
import 'package:vc_deca_web/navbar/home_navbar.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

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
