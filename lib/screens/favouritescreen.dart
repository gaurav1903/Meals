import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouritemeals;
  FavouriteScreen(this.favouritemeals);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('favourites'),
    );
  }
}
