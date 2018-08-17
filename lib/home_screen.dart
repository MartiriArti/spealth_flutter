import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spealth',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        body: new Container(
            child: new Text("fvdfbgbgfbgfbb"),color: Colors.white,),
      ),
    );
  }
}