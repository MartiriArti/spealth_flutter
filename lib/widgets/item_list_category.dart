import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/model/spealth_card.dart';

class SpealthItemList extends StatelessWidget {

  final SpealthCard spealthCard;

  SpealthItemList(this.spealthCard);

  @override
  Widget build(BuildContext context) {

    final baseTextStyle = const TextStyle(
        fontFamily: 'Palatino'
    );
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 9.0,
        fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600
    );

    final itemCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(height: 4.0),
            new Text(spealthCard.category, style: headerTextStyle),
            new Container(height: 10.0),
            new Text(spealthCard.category, style: subHeaderTextStyle),
            new Container(
                margin: new EdgeInsets.symmetric(vertical: 8.0),
                height: 2.0,
                width: 18.0,
                color: new Color(0xff00c6ff)),
          ]),
    );

    final itemCard = new Container(
      child: itemCardContent,
      height: 124.0,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
        color: Colors.transparent,
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

    return new Container(
      height: 120.0,
      child: itemCard,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
    );
  }
}
