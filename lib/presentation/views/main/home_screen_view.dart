import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spealth_flutter/model/BaseScreenView.dart';
import 'package:spealth_flutter/presentation/views/auth/facebook_sign_in.dart';
import 'package:spealth_flutter/presentation/views/main/home_screen.dart';
import 'package:spealth_flutter/presentation/views/splash/sign_in_screen.dart';

class HomeScreenView extends BaseScreenView<HomeScreen> {
  // var profileData;

//  HomeScreenView({Key key, @required this.profileData});

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => _dialogResult(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () => _dialogResult(true),
                    child: new Text('Yes'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: new AppBar(
            title: Text("Main"),
          ),
          body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: 200.0,
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: DecorationImage(
//                      fit: BoxFit.fill,
//                      image: NetworkImage(
//                        profileData['picture']['data']['url'],
//                      ),
//                    ),
//                  ),
                ),
                SizedBox(height: 28.0),
                Text(
                  //    "Logged in as: ${profileData['name']}",
                  ",",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 28.0),
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
                    'Log out',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _onWillPop();
                  },
                ),
              ],
            ),
          ),
        ));
  }

  _dialogResult(select) {
    if (select) {
      FacebookSigInService().signOut();
      navigateTo(context, SignInScreen());
    } else {
      Navigator.of(context).pop(select);
    }
  }
}
