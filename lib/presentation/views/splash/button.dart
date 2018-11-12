import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget button(title, [uri, color]) {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          uri != null
              ? SvgPicture.asset(
                  uri,
                  width: 25.0,
                )
              : Container(),
          Padding(
            child: Text(
              title,
              style: TextStyle(
                color: color,
              ),
            ),
            padding: new EdgeInsets.all(15.0),
          ),
        ],
      ),
    ),
  );
}
