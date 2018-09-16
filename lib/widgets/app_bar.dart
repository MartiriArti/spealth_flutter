import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAppBar extends StatefulWidget {
 // final VoidCallback iconAction;

  MyAppBar({Text title});

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
 // IconData _icon;

  @override
  void initState() {
    super.initState();
   // _icon = Icons.notifications;
  }

//  _changeIcon() {
//    setState(() {
//      if (_icon == Icons.notifications) {
//        _icon = Icons.notifications_off;
//      } else {
//        _icon = Icons.notifications;
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Center(
        child: Container(
          height: 90.0,
          color: Colors.white,
          //color: Colors.red,
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 30.0, right: 4.0),
                    child: Material(
                      color: Colors.white,
                      shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
                      child: InkWell(
                        child: Icon(
                          null,
                          color: Colors.black54,
                          size: 30.0,
                        ),
                        onTap: () {
                          //
                          //widget.iconAction();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 16.0, right: 20.0),
                    child: Image.asset(
                      "assets/images/settings.png",
                      height: 80.0,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        //////
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}