import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:spealth_flutter/model/BaseScreenView.dart';
import 'package:spealth_flutter/presentation/views/auth/facebook_sign_in.dart';
import 'package:spealth_flutter/presentation/views/main/home_screen.dart';
import 'package:spealth_flutter/presentation/views/splash/sign_in_screen.dart';

class SignInScreenView extends BaseScreenView<SignInScreen>
    with SingleTickerProviderStateMixin {
  int _state = 0;
  var profile;
  bool loginStatus = false;
  AnimationController controller;
  Animation<double> animation;
  Tween tween = new Tween<double>(begin: 0.0, end: 150.0);
  var typeOfLogin = false;
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton.icon(
              color: Colors.white,
              icon: SizedBox(
                width: 50.0,
                height: 50.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                  child: SvgPicture.asset(
                    'assets/icons/google_icon.svg',
                  ),
                ),
              ),
              label: Text(
                '  Login with Google  ',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (_state == 0) {
                    animateButton();
                  }
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            RaisedButton.icon(
              color: Colors.indigo,
              icon: SizedBox(
                width: 50.0,
                height: 50.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: SvgPicture.asset(
                    'assets/icons/facebook_icon.svg',
                  ),
                ),
              ),
              label: Text(
                'Login with Facebook',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
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
                      fontSize: 95.0,
                      fontFamily: "Palatino",
                      color: Colors.white),
                ),
              )),
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
