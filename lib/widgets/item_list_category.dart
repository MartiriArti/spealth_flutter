import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/widgets/spealth_card.dart';

class SpealthItemList extends StatelessWidget {

  final SpealthCard spealthCard;

  SpealthItemList(this.spealthCard);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
          ],
        ));
  }

  final planetCard = new Container(
    child: planetCardContent,
    height: 124.0,
    decoration: new BoxDecoration(
      color: Colors.lightBlueAccent,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );

  static var planetCardContent = new Container(
    margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text("/////"),
          new Container(height: 10.0),
          new Text("jjjjj"),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
        ]),
  );
}
