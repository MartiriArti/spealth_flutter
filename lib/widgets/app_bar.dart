import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAppBar extends StatelessWidget {
  String _text;

  MyAppBar(String text) {
    this._text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 84.0,
        color: Colors.blueGrey,
        //color: Colors.red,
        child: new Column(
          children: <Widget>[
            new Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 26.0, left: 16.0, right: 4.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 4.0),
                      child: new Text(
                        _text,
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 154.0, right: 4.0),
                      child: Material(
                        color: Colors.blueGrey,
                          child: Image.asset(
                            "assets/icons/settings.png",
                            height: 36.0,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
