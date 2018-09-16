import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/widgets/bottom_button.dart';

class BottomBar extends StatefulWidget {
  @override
  BottomBarState createState() {
    return new BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  var actions;

  @override
  void initState() {
    super.initState();
    actions = <Widget>[
      BottomButton("assets/icons/foodapple.png", "Health", Colors.blueGrey,
          () => _bottomButtonTap()),
      BottomButton("assets/icons/food.png", "Food", Colors.blueGrey,
          () => _bottomButtonTap()),
      BottomButton("assets/icons/settings.png", "Settings", Colors.blueGrey,
          () => _bottomButtonTap())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      //color: Colors.green,
      child: Card(
        margin: EdgeInsets.only(top: 2.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: actions),
        ),
      ),
    );
  }

  void _bottomButtonTap() async {
    print("??????");
  }
}
