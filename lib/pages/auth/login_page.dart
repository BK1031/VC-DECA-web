import 'package:flutter/material.dart';
import 'package:vc_deca_web/utils/theme.dart';
import 'package:firebase/firebase.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Widget buttonChild = new Text("Login");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 6.0,
          child: new Container(
            padding: EdgeInsets.all(32.0),
            height: 400.0,
            width: 500.0,
            child: new ListView(
              children: <Widget>[
                new Text("Login", style: TextStyle(fontFamily: "Product Sans", fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                new Padding(padding: EdgeInsets.all(16.0),),
                new Text("Login to your VC DECA Account below!", style: TextStyle(fontFamily: "Product Sans",), textAlign: TextAlign.center,),
                new TextField(
                  decoration: InputDecoration(
                      icon: new Icon(Icons.email),
                      labelText: "Email",
                      hintText: "Enter your email"
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                ),
                new TextField(
                  decoration: InputDecoration(
                      icon: new Icon(Icons.lock),
                      labelText: "Password",
                      hintText: "Enter your password"
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  obscureText: true,
                ),
                new Padding(padding: EdgeInsets.all(8.0)),
                new RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () {},
                  child: buttonChild,
                  elevation: 0.0,
                  color: mainColor,
                  textColor: Colors.white,
                ),
                new Padding(padding: EdgeInsets.all(8.0)),
                new FlatButton(
                  child: new Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: mainColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
