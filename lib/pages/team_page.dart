import 'package:flutter/material.dart';
import 'package:vc_deca_web/navbar/team_navbar.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          TeamNavbar(),
        ],
      ),
    );
  }
}
