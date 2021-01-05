import 'package:meals/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:meals/12.1 dummy_data.dart';
import 'package:meals/screens/main_drawer.dart';

class DetailPage extends StatelessWidget {
  final Function togglefavourites;
  final List favourites;
  DetailPage(this.togglefavourites, this.favourites);
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final Meal selectedMeal = DUMMY_MEALS.firstWhere((x) {
      if (x.id == id)
        return true;
      else
        return false;
    });
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(selectedMeal.imageUrl)),
              Container(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    icon: favourites.any((element) => element.id == id)
                        ? Icon(Icons.star, size: 40, color: Colors.yellow)
                        : Icon(Icons.star_border_outlined,
                            size: 35, color: Colors.yellow),
                    onPressed: () {
                      togglefavourites(id);
                    },
                  ),
                  backgroundColor: Colors.black,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text('Ingredients',
                style: Theme.of(context).textTheme.headline6),
          ),
          new_container(selectedMeal: selectedMeal, id: 1),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text('Recipe', style: Theme.of(context).textTheme.headline6),
          ),
          new_container(selectedMeal: selectedMeal, id: 2)
        ],
      ),
    );
  }
}

class new_container extends StatelessWidget {
  const new_container({
    Key key,
    @required this.selectedMeal,
    @required this.id,
  }) : super(key: key);

  final Meal selectedMeal;
  final int id;
  @override
  Widget build(BuildContext context) {
    Widget child_widget(String x) {
      return Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(x),
        ),
      );
    }

    Widget child_widget2() {
      return Container(
        child: ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text('# ${(index + 1)}')),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              );
            }),
      );
    }

    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: id == 1
            ? ListView(
                children: selectedMeal.ingredients.map((x) {
                return child_widget(x);
              }).toList())
            : child_widget2(),
      ),
    );
  }
}
