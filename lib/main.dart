import 'package:flutter/material.dart';
import 'file:///C:/Users/gaura/AndroidStudioProjects/meals/lib/screens/Meal_screen.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filterscreen.dart';
import 'package:meals/screens/meals_detail.dart';
import 'package:meals/screens/tabscreen.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/12.1 dummy_data.dart ';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availablemeal = DUMMY_MEALS;
  List<Meal> favouritemeals = [];
  void setfilters(Map<String, bool> filterdata) {
    setState(() {
      filters = filterdata;
      availablemeal = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegetarian'] && !meal.isVegetarian) return false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed')),
        shadowColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabScreen(favouritemeals), //entry point of app
      routes: {
        '/meals': (_) {
          return Mealscreen(availablemeal);
        },
        '/details': (_) {
          return DetailPage();
        },
        '/filters': (_) {
          return FilterScreen(filters, setfilters);
        }
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (_) {
          return Categories();
        });
      },
    );
  }
}
