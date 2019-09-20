import 'package:flutter/material.dart';
import 'package:vc_deca_web/navbar/store_navbar.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          StoreNavbar(),
        ],
      ),
    );
  }
}
