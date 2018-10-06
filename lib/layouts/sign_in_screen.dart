import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:spealth_flutter/layouts/home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/background.png'),
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
    return Stack(children: <Widget>[
      new Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Text(
              "Spealth",
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 95.0, fontFamily: "Palatino", color: Colors.white),
            ),
          )),
      new Align(
        alignment: Alignment.bottomLeft,
        child: new IconButton(
          iconSize: 105.0,
          icon: new Image.asset('assets/icons/google.png'),
          onPressed: (_handleSignIn),
        ),
      ),
      new Align(
        alignment: Alignment.bottomRight,
        child: new IconButton(
          iconSize: 105.0,
          icon: new Image.asset('assets/icons/facebook.png'),
          onPressed: (_handleSignIn),
        ),
      ),
    ]);
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
