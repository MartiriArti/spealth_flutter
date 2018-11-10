import 'package:flutter/material.dart';
import 'package:spealth_flutter/presentation/views/auth/facebook_sign_in.dart';
import 'package:spealth_flutter/presentation/views/base/BaseScreenView.dart';
import 'package:spealth_flutter/presentation/views/main/home_screen.dart';
import 'package:spealth_flutter/presentation/views/splash/sign_in_screen.dart';

class HomeScreenView extends BaseScreenView<HomeScreen> {
  // var profileData;

//  HomeScreenView({Key key, @required this.profileData});

  Future<bool> _onWillPop() async {
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
      child: MaterialApp(
        color: Colors.yellow,
        home: DefaultTabController(
          length: 4,
          child: new Scaffold(
            body: TabBarView(
              children: [
                new Container(
                  color: Colors.yellow,
                ),
                new Container(
                  color: Colors.orange,
                ),
                new Container(
                  color: Colors.lightGreen,
                ),
              ],
            ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
              title: Text(
                "Spealth",
              ),
            ),
            bottomNavigationBar: new TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.healing),
                  text: "Health",
                ),
                Tab(
                  icon: Icon(Icons.directions_run),
                  text: "Sport",
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: "Settings",
                )
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.blueGrey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.blueAccent,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  _dialogResult(select) {
    if (select) {
      FacebookSigInService().signOut();
      navigateEffect(SignInScreen());
    } else {
      Navigator.of(context).pop(select);
    }
  }
}
