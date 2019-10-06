import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:vc_deca_web/models/announcement.dart';
import 'package:vc_deca_web/navbar/home_navbar.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'dart:html' as html;

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {

  List<Announcement> announcementList = new List();

  @override
  void initState() {
    super.initState();
    if (fb.auth().currentUser != null) {
      fb.database().ref("alerts").onChildAdded.listen((event) {
        setState(() {
          announcementList.add(new Announcement.fromSnapshot(event.snapshot));
        });
      });
    }
//    else {
//      Navigator.pushNamed(context, '/login');
//    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: currBackgroundColor,
      floatingActionButton: new Visibility(
        visible: true,
        child: new FloatingActionButton(
          child: new Icon(Icons.add),
          backgroundColor: mainColor,
          onPressed: () {
            Navigator.pushNamed(context, '/home/announcements/new');
          },
        ),
      ),
      body: new Column(
        children: <Widget>[
          HomeNavbar(),
          new Expanded(
            child: new Container(
              padding: EdgeInsets.all(16.0),
              child: new Column(
                children: <Widget>[
                  new Visibility(
                      visible: (announcementList.length == 0),
                      child: new Text("Nothing to see here!\nCheck back later for announcements.", textAlign: TextAlign.center)
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: 8.0)),
                  new Expanded(
                    child: ListView.builder(
                      itemCount: announcementList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new Column(
                          children: <Widget>[
                            new Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                              color: currCardColor,
                              elevation: 6.0,
                              child: new InkWell(
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                onTap: () {

                                },
                                child: new Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Container(
                                          child: new Icon(
                                            Icons.notifications_active,
                                            color: mainColor,
                                          )
                                      ),
                                      new Padding(padding: EdgeInsets.all(4.0)),
                                      new Column(
                                        children: <Widget>[
                                          new Container(
                                            width: MediaQuery.of(context).size.width - 150,
                                            child: new Text(
                                              announcementList[index].title,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontFamily: "Product Sans",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          new Padding(padding: EdgeInsets.all(4.0)),
                                          new Container(
                                            width: MediaQuery.of(context).size.width - 150,
                                            child: new Text(
                                              announcementList[index].body,
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: "Product Sans",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      new Padding(padding: EdgeInsets.all(4.0)),
                                      new Container(
                                          child: new Icon(
                                            Icons.arrow_forward_ios,
                                            color: mainColor,
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            new Padding(padding: EdgeInsets.all(4.0))
                          ],
                        );
                      },
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
