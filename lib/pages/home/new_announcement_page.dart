import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:vc_deca_web/models/announcement.dart';
import 'package:intl/intl.dart';
import 'package:vc_deca_web/navbar/home_navbar.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'dart:html' as html;

class NewAnnouncementPage extends StatefulWidget {
  @override
  _NewAnnouncementPageState createState() => _NewAnnouncementPageState();
}

class _NewAnnouncementPageState extends State<NewAnnouncementPage> {

  String alertTitle = "";
  String alertBody = "";

  bool sendNotif = true;

  final bodyController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (fb.auth().currentUser != null) {
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
                    new TextField(
                      decoration: InputDecoration(
                          labelText: "Title"
                      ),
                      autocorrect: true,
                      onChanged: (input) {
                        setState(() {
                          alertTitle = input;
                        });
                      },
                    ),
                    new TextField(
                      decoration: InputDecoration(
                          labelText: "Details"
                      ),
                      maxLines: null,
                      autocorrect: true,
                      onChanged: (input) {
                        setState(() {
                          alertBody = input;
                        });
                      },
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: 75.0,
                      child: new RaisedButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (BuildContext context) {
                            return new ConfirmSheet(alertTitle, alertBody, sendNotif);
                          });
                        },
                        color: mainColor,
                        child: new Text("Publish Announcement", style: TextStyle(fontFamily: "Product Sans", color: Colors.white, fontSize: 18.0),),
                      ),
                      padding: EdgeInsets.all(16.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
    else {
      return new Material(
        child: Center(
          child: new Text("This is a protected function"),
        ),
      );
    }
  }
}

// ignore: must_be_immutable
class ConfirmSheet extends StatefulWidget {

  String alertTitle = "";
  String alertBody = "";

  bool sendNotif = false;

  ConfirmSheet(this.alertTitle, this.alertBody, this.sendNotif);

  @override
  _ConfirmSheetState createState() => _ConfirmSheetState(this.alertTitle, this.alertBody, this.sendNotif);
}

class _ConfirmSheetState extends State<ConfirmSheet> {

  String alertTitle = "";
  String alertBody = "";
  
  String name = "";

  bool sendNotif = false;
  List<String> topic = ["","ALL_DEVICES"];

  double visibiltiyBoxHeight = 0.0;

  _ConfirmSheetState(String alertTitle, String alertBody, bool sendNotif) {
    this.alertTitle = alertTitle;
    this.alertBody = alertBody;
    this.sendNotif = sendNotif;
    fb.database().ref("users/${fb.auth().currentUser.uid}/name").onValue.listen((event) {
      name = event.snapshot.val();
    });
  }

  publish(String title, String alert) {
    if (title != "" && alert != "") {
      fb.database().ref("alerts").push().update({
        "title": title,
        "body": alert,
        "date": new DateFormat('MM/dd/yyyy hh:mm aaa').format(new DateTime.now()),
        "author": name,
        "topic": topic
      });
      if (sendNotif) {
        print("Notification added to queue");
        fb.database().ref("notifications").push().update({
          "title": "New Announcement",
          "body": title,
          "topic": topic
        });
      }
      Navigator.pop(context);
    }
    else {
      print("Missing Data");
    }
  }

  Widget getTrailingCheck(String val) {
    Widget returnWidget = Container(child: new Text(""),);
    if (topic.contains(val)) {
      setState(() {
        returnWidget = Icon(Icons.check, color: mainColor);
      });
    }
    return returnWidget;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: currCardColor,
      child: new SafeArea(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
              child: new Text(
                alertTitle,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.visibility),
              title: new Text("Visibility"),
              trailing: new Text(
                  topic.length != 0 ? topic.toString().substring(2, topic.toString().length-1) : "No target selected",
                  style: TextStyle(color: darkMode ? Colors.grey : Colors.black54)
              ),
              onTap: () {
                setState(() {
                  if (visibiltiyBoxHeight == 0.0) {
                    visibiltiyBoxHeight = 195;
                  }
                  else {
                    visibiltiyBoxHeight = 0.0;
                  }
                });
              },
            ),
            new AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: visibiltiyBoxHeight,
                child: new Scrollbar(
                  child: new ListView(
                    padding: EdgeInsets.only(right: 16.0, left: 16.0),
                    children: <Widget>[
                      new ListTile(
                        title: new Text("All Members"),
                        trailing: getTrailingCheck('ALL_DEVICES'),
                        onTap: () {
                          setState(() {
                            if (!topic.contains('ALL_DEVICES')) {
                              topic = ["","ALL_DEVICES"];
                            }
                            else {
                              topic.remove('ALL_DEVICES');
                            }
                          });
                          print(topic);
                        },
                      ),
                      new ListTile(
                        title: new Text("Advisors"),
                        trailing: getTrailingCheck('ADVISOR'),
                        onTap: () {
                          setState(() {
                            if (!topic.contains('ADVISOR')) {
                              topic.add('ADVISOR');
                              if (topic.contains('ALL_DEVICES')) {
                                topic.remove('ALL_DEVICES');
                              }
                            }
                            else {
                              topic.remove('ADVISOR');
                            }
                          });
                          print(topic);
                        },
                      ),
                      new ListTile(
                        title: new Text("Chaperones"),
                        trailing: getTrailingCheck('CHAPERONE'),
                        onTap: () {
                          setState(() {
                            if (!topic.contains('CHAPERONE')) {
                              topic.add('CHAPERONE');
                              if (topic.contains('ALL_DEVICES')) {
                                topic.remove('ALL_DEVICES');
                              }
                            }
                            else {
                              topic.remove('CHAPERONE');
                            }
                          });
                          print(topic);
                        },
                      ),
                      new ListTile(
                        title: new Text("Officers"),
                        trailing: getTrailingCheck('OFFICER'),
                        onTap: () {
                          setState(() {
                            if (!topic.contains('OFFICER')) {
                              topic.add('OFFICER');
                              if (topic.contains('ALL_DEVICES')) {
                                topic.remove('ALL_DEVICES');
                              }
                            }
                            else {
                              topic.remove('OFFICER');
                            }
                          });
                          print(topic);
                        },
                      ),
                      new ListTile(
                        title: new Text("Committee Members"),
                        trailing: getTrailingCheck('COMMITTEE_MEMBER'),
                        onTap: () {
                          setState(() {
                            if (!topic.contains('COMMITTEE_MEMBER')) {
                              topic.add('COMMITTEE_MEMBER');
                              if (topic.contains('ALL_DEVICES')) {
                                topic.remove('ALL_DEVICES');
                              }
                            }
                            else {
                              topic.remove('COMMITTEE_MEMBER');
                            }
                          });
                          print(topic);
                        },
                      ),
                      new ListTile(
                        title: new Text("Cluster Mentors"),
                        trailing: getTrailingCheck('CLUSTER_MENTOR'),
                        onTap: () {
                          setState(() {
                            if (!topic.contains('CLUSTER_MENTOR')) {
                              topic.add('CLUSTER_MENTOR');
                              if (topic.contains('ALL_DEVICES')) {
                                topic.remove('ALL_DEVICES');
                              }
                            }
                            else {
                              topic.remove('CLUSTER_MENTOR');
                            }
                          });
                          print(topic);
                        },
                      ),
                      new ListTile(
                        title: new Text("Members"),
                        trailing: getTrailingCheck('MEMBER'),
                        onTap: () {
                          setState(() {
                            if (!topic.contains('MEMBER')) {
                              topic.add('MEMBER');
                              if (topic.contains('ALL_DEVICES')) {
                                topic.remove('ALL_DEVICES');
                              }
                            }
                            else {
                              topic.remove('MEMBER');
                            }
                          });
                          print(topic);
                        },
                      ),
                    ],
                  ),
                )
            ),
            new ListTile(
              leading: sendNotif ? new Icon(Icons.notifications_active) : new Icon(Icons.notifications_off),
              title: new Text("Send Notification"),
              trailing: new Switch.adaptive(
                value: sendNotif,
                activeColor: mainColor,
                onChanged: (value) {
                  setState(() {
                    sendNotif = value;
                  });
                  print("Notify - $sendNotif");
                },
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              height: 75.0,
              child: Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text("Cancel", style: TextStyle(fontFamily: "Product Sans", color: mainColor, fontSize: 18.0),),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(32.0)),
                  new Expanded(
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        publish(alertTitle, alertBody);
                        Navigator.pop(context);
                      },
                      color: mainColor,
                      child: new Text("Confirm", style: TextStyle(fontFamily: "Product Sans", color: Colors.white, fontSize: 18.0),),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0),
            )
          ],
        ),
      ),
    );
  }
}