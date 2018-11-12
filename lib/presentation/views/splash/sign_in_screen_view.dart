import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:spealth_flutter/presentation/views/auth/facebook_sign_in.dart';
import 'package:spealth_flutter/presentation/views/base/BaseScreenView.dart';
import 'package:spealth_flutter/presentation/views/main/home_screen.dart';
import 'package:spealth_flutter/presentation/views/splash/button.dart';
import 'package:spealth_flutter/presentation/views/splash/sign_in_screen.dart';

class SignInScreenView extends BaseScreenView<SignInScreen>
    with SingleTickerProviderStateMixin {
  int _state = 0;
  var profile;
  var typeOfLogin = false;
  bool loginStatus = false;
  AnimationController controller;
  Animation<double> animation;
  Tween tween = new Tween<double>(begin: 0.0, end: 150.0);

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = tween.animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (typeOfLogin) {
          _initiateFacebookLogin();
        } else {
          _initLogin();
        }
      } else if (status == AnimationStatus.dismissed) {
        _state = 2;
        if (loginStatus) {
          typeOfLogin = false;
          navigateTo(context, HomeScreen());
        }
      }
    });
    animation.addListener(() {
      setState(() {});
    });
  }

  void animateButton() async {
    setState(() {
      _state = 1;
      controller.forward(from: 0.0);
    });
  }

  Widget setUpButtonChild() {
    switch (_state) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MaterialButton(
                color: Colors.white,
                child: button(
                  'Sign in with Google',
                  'assets/icons/google_icon.svg',
                ),
                onPressed: () {
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                  });
                },
              ),
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),
              MaterialButton(
                color: Color.fromRGBO(58, 89, 152, 1.0),
                child: button(
                  'Sign in with Facebook',
                  'assets/icons/facebook_icon.svg',
                  Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                      typeOfLogin = true;
                    }
                  });
                },
              ),
            ],
          ),
        );
        break;
      case 1:
        return Stack(children: <Widget>[
          Positioned(
            child: RefreshProgressIndicator(),
            bottom: animation.value,
            left: MediaQuery.of(context).size.width * 0.5 - 25,
          ),
        ]);
      default:
        return Container(
          width: 0.0,
          height: 0.0,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: Text(
                "Spealth",
                textAlign: TextAlign.start,
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 85.0,
                    fontFamily: "Palatino",
                    color: Colors.white),
              ),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: setUpButtonChild()),
        ],
      ),
    );
  }

  void _initiateFacebookLogin() async {
    var facebookLoginResult = await FacebookSigInService().signIn();
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}');
        profile = json.decode(graphResponse.body);
        print(profile.toString());
        onLoginStatusChanged(true);
        break;
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  _initLogin() {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) async {
      if (account != null) {
        _handleSignIn();
        print(account);
      } else {
        // user NOT logged
      }
    });
    _googleSignIn
        .signInSilently()
        .whenComplete(() => onLoginStatusChanged(true));
  }

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      if (isLoggedIn) {
        controller.reverse();
      } else {
        controller.dispose();
      }
      this.loginStatus = isLoggedIn;
    });
  }
}
