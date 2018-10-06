import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
class MyAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  MyAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 0.55],
            tileMode: TileMode.clamp),
      ),
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 120.0, right: 4.0),
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'courgette',
                      fontWeight: FontWeight.w600,
                      fontSize: 36.0)),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 54.0, right: 4.0),
              child: Material(
                color: Colors.transparent,
                child: Image.asset(
                  "assets/icons/settings.png",
                  height: 36.0,
                ),
              ),
            ),
          ]),
    );
  }
}
