import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screen_widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouritemeals;
  FavouriteScreen(this.favouritemeals);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: favouritemeals.map((m) {
        return MealItem(
          id: m.id,
          affordability: m.affordability,
          complexity: m.complexity,
          title: m.title,
          duration: m.duration,
          ImageUrl: m.imageUrl,
        );
      }).toList(),
    );
  }
}
