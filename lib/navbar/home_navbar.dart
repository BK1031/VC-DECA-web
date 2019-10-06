import 'package:flutter/material.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'package:firebase/firebase.dart' as fb;
import 'dart:html' as html;

class HomeNavbar extends StatefulWidget {
  @override
  _HomeNavbarState createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      color: currCardColor,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 100,
            width: 300,
            child: new Image.network(
              "https://github.com/Equinox-Initiative/VC-DECA-flutter/blob/master/images/vcdeca_blue_trans.png?raw=true",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              new FlatButton(
                child: new Text("HOME"),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              new FlatButton(
                child: new Text("ABOUT"),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              new FlatButton(
                child: new Text("TEAM"),
                onPressed: () {
                  Navigator.pushNamed(context, '/team');
                },
              ),
              new FlatButton(
                child: new Text("EVENTS"),
                onPressed: () {
                  Navigator.pushNamed(context, '/events');
                },
              ),
              new FlatButton(
                child: new Text("STORE"),
                onPressed: () {
                  Navigator.pushNamed(context, '/store');
                },
              ),
              new Padding(padding: EdgeInsets.all(4.0),),
              new Visibility(
                visible: fb.auth().currentUser == null,
                child: new RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                  child: new Text("LOGIN"),
                  textColor: Colors.white,
                  color: mainColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
              new Visibility(visible: fb.auth().currentUser == null, child: new Padding(padding: EdgeInsets.all(8.0),)),
              new Visibility(
                visible: fb.auth().currentUser == null,
                child: new RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                  child: new Text("REGISTER"),
                  textColor: Colors.white,
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ),
              new Visibility(
                visible: fb.auth().currentUser != null,
                child: new RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                  child: new Text("SIGN OUT"),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      fb.auth().signOut();
                    });
//                    Navigator.pushNamed(context, '/register');
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
