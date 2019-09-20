import 'package:flutter/material.dart';
import 'package:vc_deca_web/utils/theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Widget buttonChild = new Text("Create Account");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 6.0,
          child: new Container(
            padding: EdgeInsets.all(32.0),
            height: 600.0,
            width: 500.0,
            child: new ListView(
              children: <Widget>[
                new Text("Register", style: TextStyle(fontFamily: "Product Sans", fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                new Padding(padding: EdgeInsets.all(16.0),),
                new Text("Create your VC DECA Account below!", style: TextStyle(fontFamily: "Product Sans",), textAlign: TextAlign.center,),
                new TextField(
                  decoration: InputDecoration(
                      labelText: "First Name",
                      hintText: "Enter your first name"
                  ),
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                ),
                new TextField(
                  decoration: InputDecoration(
                      labelText: "Last Name",
                      hintText: "Enter your last name"
                  ),
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                ),
                new TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email"
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                ),
                new TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter a password"
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  obscureText: true,
                ),
                new TextField(
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Confirm your password"
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
                    "Already have an account?",
                    style: TextStyle(
                      color: mainColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
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
