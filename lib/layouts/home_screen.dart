import 'package:flutter/material.dart';
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
        appBar: new AppBar(
          title: new Text(
            "Spealth",
            textScaleFactor: 1.5,
          ),
        ),
        body: new Container(
          child: new Center(
            child: new Text(
              "Home Screen",
              textScaleFactor: 2.0,
            ),
          ),
        ),
        bottomNavigationBar: new BottomBar(),
      ),
    );
  }
}
