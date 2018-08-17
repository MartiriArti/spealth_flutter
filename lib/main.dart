import 'package:flutter/material.dart';
import 'package:spealth_flutter/sign_in_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Spealth',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SignInScreen(),
    );
  }
}

