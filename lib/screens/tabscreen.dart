import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/favouritescreen.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/model/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouritemeals;
  TabScreen(this.favouritemeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> Pages;
  int selectedpageindex = 0;
  void selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  void initState() {
    Pages = [
      {'title': 'Categories', 'widget': Categories()},
      {'widget': FavouriteScreen(widget.favouritemeals), 'title': 'Favourites'}
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(Pages[selectedpageindex]['title']),
      ),
      body: Pages[selectedpageindex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 15,
        currentIndex: selectedpageindex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
