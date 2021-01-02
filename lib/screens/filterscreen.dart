import 'package:flutter/material.dart';
import 'package:meals/screens/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function savefilter;
  final Map<String, bool> filterval;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedfilters = {
                'gluten': false,
                'lactose': false,
                'vegan': false,
                'vegetarian': false
              };
              return widget.savefilter(selectedfilters);
            },
          ),
        ],
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
                  });
                }),
                buildswitchtile('Lactose-free',
                    'Only include lactose-free meals', lactosefree, (newval) {
                  setState(() {
                    lactosefree = newval;
                  });
                }),
                buildswitchtile(
                    'Vegetarian', 'Only include vegetarian meals', vegetarian,
                    (newval) {
                  setState(() {
                    vegetarian = newval;
                  });
                }),
                buildswitchtile('Vegan', 'Only include vegan meals', vegan,
                    (newval) {
                  setState(() {
                    vegan = newval;
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
