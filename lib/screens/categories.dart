import 'package:meals/model/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/screen_widgets/category_item.dart';
import 'package:meals/12.1 dummy_data.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((each) {
        return Item(title: each.title, colour: each.color, id: each.id);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      scrollDirection: Axis.vertical,
    );
  }
}
