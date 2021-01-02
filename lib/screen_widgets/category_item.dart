import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final Color colour;
  final String title;
  final String id;
  Item({
    this.title,
    this.colour,
    this.id,
  });
  void SelectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed('/meals', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return SelectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [colour.withOpacity(0.6), colour],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
      ),
    );
  }
}
