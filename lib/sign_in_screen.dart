import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:spealth_flutter/home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spealth',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        body: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/loginscreen.jpg'),
                colorFilter: ColorFilter.mode(Colors.tealAccent, BlendMode.colorBurn),
                fit: BoxFit.cover,
              ),
            ),
            child: new SignInScreenRegistr()),
      ),
    );
  }
}

class SignInScreenRegistr extends StatefulWidget {
  SignInScreenRegistr({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

String _displayName;

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class _SignInScreenState extends State<SignInScreenRegistr> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
    new Align(
      alignment: Alignment.topCenter,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Text(
      "Spealth",
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontSize: 94.0,
          fontFamily: "Courgette",
          color: Colors.white,
          decoration: TextDecoration.none),
    ),
    )),
    new Align(
      alignment: Alignment.bottomCenter,
        child: new Container(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: (_handleSignIn),
                  child: new Text('G+ ',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(left: 40.0)),
              new Container(
                  child: new FloatingActionButton(
                    backgroundColor: Colors.blueAccent,
                  onPressed: (null),
                  child: new Text('f',
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
              ),
              new Padding(padding: new EdgeInsets.only(left: 40.0)),
              new Container(
                child: new FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  onPressed: (null),
                  child: new Text('t',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(left: 40.0)),
              new Container(
                child: new FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: (null),
                  child: new Text('...',
                      style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                ),
              ),
            ]),
    ))]);
  }

  Future<Null> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print('signed in ' + _googleSignIn.currentUser.displayName);
      _displayName = _googleSignIn.currentUser.displayName;
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new HomeScreen()));
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  Future<Null> _handleSignOut() async {
    _googleSignIn.disconnect();
    print('signed out ');
    _displayName = null;
    setState(() {});
  }
}
