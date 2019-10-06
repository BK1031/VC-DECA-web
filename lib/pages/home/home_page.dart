import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:vc_deca_web/navbar/home_navbar.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: currBackgroundColor,
      body: new Column(
        children: <Widget>[
          HomeNavbar(),
          new Expanded(
            child: new Container(
              padding: EdgeInsets.all(32.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    width: double.infinity,
                    height: 100.0,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          flex: 5,
                          child: new Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                            color: currCardColor,
                            elevation: 6.0,
                            child: new InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onTap: () {
                              },
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(Icons.event, size: 35.0, color: darkMode ? Colors.grey : Colors.black54),
                                  new Text(
                                    "My Events",
                                    style: TextStyle(fontSize: 13.0, color: currTextColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.all(4.0)),
                        new Expanded(
                          flex: 3,
                          child: new Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                            color: currCardColor,
                            elevation: 6.0,
                            child: new InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onTap: () {
                                Navigator.pushNamed(context, '/home/announcements');
                              },
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Text(
                                    "0",
                                    style: TextStyle(fontSize: 35.0, color: darkMode ? Colors.grey : Colors.black54),
                                  ),
                                  new Text(
                                    "Announcements",
                                    style: TextStyle(fontSize: 13.0, color: currTextColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(4.0)),
                  new Container(
                    width: double.infinity,
                    height: 100.0,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          flex: 3,
                          child: new Visibility(
                            visible: true,
                            child: new Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                              color: currCardColor,
                              elevation: 6.0,
                              child: new InkWell(
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                onTap: () {
                                },
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Icon(Icons.notifications_active, size: 35.0, color: darkMode ? Colors.grey : Colors.black54,),
                                    new Text(
                                      "Send Notification",
                                      style: TextStyle(fontSize: 13.0, color: currTextColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.all(4.0)),
                        new Expanded(
                          flex: 5,
                          child: new Visibility(
                            visible: true,
                            child: new Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                              color: currCardColor,
                              elevation: 6.0,
                              child: new InkWell(
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                onTap: () {
                                  // TODO: Implement role management
                                },
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Icon(Icons.supervised_user_circle, size: 35.0, color: darkMode ? Colors.grey : Colors.black54),
                                    new Text(
                                      "Manage Users",
                                      style: TextStyle(fontSize: 13.0, color: currTextColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
