import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screen_widgets/meal_item.dart';
import 'package:meals/screens/main_drawer.dart';

class Mealscreen extends StatelessWidget {
  final List<Meal> available;
  Mealscreen(this.available);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final List<Meal> categoryList = available.where((x) {
      return (x.categories).contains(id);
    }).toList();
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          '$title',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              affordability: categoryList[index].affordability,
              title: categoryList[index].title,
              complexity: categoryList[index].complexity,
              duration: categoryList[index].duration,
              ImageUrl: categoryList[index].imageUrl,
              id: categoryList[index].id);
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
