import 'package:flutter/material.dart';
import 'package:meel_app/widgets/main_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({Key key}) : super(key: key);
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this.saveFilter, this._currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    _isGlutenFree = widget._currentFilters['gluten'];
    _isLactoseFree = widget._currentFilters['lactose'];
    _isVegan = widget._currentFilters['vegan'];
    _isVegetarian = widget._currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitch(
      bool switchVar, String title, String subTitle, Function updateFun) {
    return SwitchListTile(
      value: switchVar,
      onChanged: updateFun,
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Saved",
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilter(selectedFilters);
            },
            padding: EdgeInsets.only(right: 30.0),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Adjust your meal Selection ",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitch(_isGlutenFree, "Gluten Free",
                  "Only include gluten free meals", (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              buildSwitch(_isLactoseFree, "Lactose Free",
                  "Only include Lactose Free meals", (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
              buildSwitch(_isVegan, "Vegan", "Only include Vegan meals",
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              buildSwitch(
                  _isVegetarian, "Vegetarian", "Only include Vegetarian meals",
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
