import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/presentation/views/base/BaseScreenView.dart';
import 'package:spealth_flutter/presentation/views/health/heath_screen.dart';

class HealthScreenView extends BaseScreenView<HealthScreen> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  List<Card> listImage;

  @override
  initState() {
    super.initState();
    listImage = [
      Card(
          child: Image.asset(
        'assets/images/1.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/2.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/3.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/4.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/5.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/6.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/7.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/8.png',
      )),
      Card(
          child: Image.asset(
        'assets/images/9.png',
      )),
    ];
  }

  Widget buildListContent(Card image) {
    return GestureDetector(
      onTap: () {
        showSnackBar(context, "Tap");
      },
      child: Padding(padding: const EdgeInsets.only(bottom: 2.0), child: image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: listImage.length,
        //padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) =>
            buildListContent(listImage[i]),
      ),
    );
  }
}
