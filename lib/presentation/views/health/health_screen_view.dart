import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/presentation/views/base/BaseScreenView.dart';
import 'package:spealth_flutter/presentation/views/health/heath_screen.dart';

class HealthScreenView extends BaseScreenView<HealthScreen> {
  final numItems = 20;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget buildListContent(int idx) {
    return GestureDetector(
      child: ListTile(
        onTap: () {
          showSnackBar(context, "Tap");
        },
        leading: CircleAvatar(
          child: Text('$idx'),
        ),
        title: Text(
          'Item $idx',
          style: _biggerFont,
        ),
        trailing: Icon(Icons.dashboard),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: ListView.builder(
          itemCount: numItems * 2,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) return Divider();
            final index = i ~/ 2 + 1;
            return buildListContent(index);
          },
        ),
      ),
    );
  }
}
