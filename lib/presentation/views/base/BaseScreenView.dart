import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScreenView<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return null;
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = true;
    });
  }

  void showSnackBar(BuildContext context, String text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

//  Future navigateEffect(Widget widget) {
//    return Navigator.push(
//        context,
//        PageRouteBuilder(
//            opaque: false,
//            pageBuilder: (BuildContext context, _, __) => widget,
//            transitionsBuilder:
//                (___, Animation<double> animation, ____, Widget child) {
//              print(animation);
//              return FadeTransition(
//                opacity: animation,
//                child: ScaleTransition(scale: animation, child: child),
//              );
//            }));
//  }
}
