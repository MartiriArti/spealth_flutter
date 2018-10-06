import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spealth_flutter/model/spealth_card.dart';
import 'package:spealth_flutter/widgets/item_list_category.dart';

class HomePageBody extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new Expanded(
        child: new Container(
          color: Colors.white,
          child: new CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                        (context, index) => new SpealthItemList(itemsOfList[index]),
                    childCount: itemsOfList.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }