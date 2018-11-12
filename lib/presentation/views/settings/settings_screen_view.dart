import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/presentation/views/base/BaseScreenView.dart';
import 'package:spealth_flutter/presentation/views/settings/settings_screen.dart';

class SettingsScreenView extends BaseScreenView<SettingsScreen> {
  Widget buildListContent() {
    return GestureDetector(
        child: ListView(children: <Widget>[
      ListTile(
        title: Text('Account'),
        onTap: () {
          showSnackBar(context, "Tap");
        },
      ),
      Divider(),
      ListTile(
        title: Text('Notifications'),
        onTap: () {
          showSnackBar(context, "Tap");
        },
      ),
      Divider(),
      ListTile(
        title: Text('Language'),
        onTap: () {
          showSnackBar(context, "Tap");
        },
      ),
      Divider(),
      ListTile(
        title: Text('About'),
        onTap: () {
          showSnackBar(context, "Tap");
        },
      ),
      Divider(),
      ListTile(
        title: Text('Support'),
        onTap: () {
          showSnackBar(context, "Tap");
        },
      ),
      Divider(),
      ListTile(
        title: Text('Log out'),
        onTap: () {
          showSnackBar(context, "Tap");
        },
      ),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: buildListContent(),
      ),
    );
  }
}
