import 'package:flutter/material.dart';
import 'package:meals/screens/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function savefilter;
  final Map<String, bool> filterval; //map which gives initial value for filters
  FilterScreen(this.filterval, this.savefilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenfree = false,
      lactosefree = false,
      vegetarian = false,
      vegan = false;
  @override
  initState() {
    bool glutenfree = widget.filterval['gluten'];
    bool lactosefree = widget.filterval['lactose'];
    bool vegetarian = widget.filterval['vegetarian'];
    bool vegan = widget.filterval['vegan'];
    super.initState();
  }

  Widget buildswitchtile(
      String title, String subtitle, bool currentval, Function updateval) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentval,
        onChanged: updateval);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> selectedfilters = {
      'gluten': glutenfree,
      'lactose': lactosefree,
      'vegan': vegan,
      'vegetarian': vegetarian
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your selections',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                buildswitchtile(
                    'Gluten-free', 'Only include gluten-free meals', glutenfree,
                    (newval) {
                  setState(() {
                    glutenfree = newval;
                    widget.savefilter(selectedfilters);
                  });
                }),
                buildswitchtile('Lactose-free',
                    'Only include lactose-free meals', lactosefree, (newval) {
                  setState(() {
                    lactosefree = newval;
                    widget.savefilter(selectedfilters);
                  });
                }),
                buildswitchtile(
                    'Vegetarian', 'Only include vegetarian meals', vegetarian,
                    (newval) {
                  setState(() {
                    vegetarian = newval;
                    widget.savefilter(selectedfilters);
                  });
                }),
                buildswitchtile('Vegan', 'Only include vegan meals', vegan,
                    (newval) {
                  setState(() {
                    vegan = newval;
                    widget.savefilter(selectedfilters);
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
