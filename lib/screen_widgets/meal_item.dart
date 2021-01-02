import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String ImageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {this.affordability,
      this.id,
      this.title,
      this.duration,
      this.complexity,
      this.ImageUrl});
  String get affordability_getter {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'shut up man';
    }
  }

  String get complexity_getter {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
    }
  }

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.pushNamed(context, '/details', arguments: id);
    }

    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(ImageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tinyrowwidget(
                      duration: duration.toString() + ' min',
                      icon: Icons.schedule),
                  tinyrowwidget(duration: complexity_getter, icon: Icons.work),
                  tinyrowwidget(
                      duration: affordability_getter, icon: Icons.attach_money),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class tinyrowwidget extends StatelessWidget {
  const tinyrowwidget({
    Key key,
    @required this.duration,
    @required this.icon,
  }) : super(key: key);

  final String duration;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6),
        Text('$duration'),
      ],
    );
  }
}
