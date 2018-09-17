import 'package:flutter/material.dart';
import 'package:spealth_flutter/widgets/app_bar.dart';
import 'package:spealth_flutter/widgets/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new Scaffold(
        body: new Column(children: <Widget>[
          new MyAppBar("Spealth"),
          new Center(
            child: new Text(
              "Home Screen",
              textScaleFactor: 2.0,
            ),
          )
        ]),
        bottomNavigationBar: new BottomBar(),
      ),
    );
  }
}
