import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/widgets/item_list_category.dart';
import 'package:spealth_flutter/widgets/lists.dart';

class HomePageBody extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new SpealthItemList(planets[0]);
    }
  }