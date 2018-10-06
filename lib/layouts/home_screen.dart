import 'package:flutter/material.dart';
import 'package:spealth_flutter/widgets/app_bar.dart';
import 'package:spealth_flutter/widgets/bottom_bar.dart';
import 'package:spealth_flutter/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Column(
          children: <Widget>[
            new MyAppBar("Spealth"),
            new HomePageBody(),
          ],
      ),
        bottomNavigationBar: new BottomBar(),
      ),
    );
  }
}
