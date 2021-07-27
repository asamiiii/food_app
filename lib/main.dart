import 'package:flutter/material.dart';
import 'package:meel_app/modules/meal.dart';
import 'package:meel_app/screens/filters_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details.dart';
import './screens/tab_screen.dart';
import 'screens/category_screens.dart';
import 'dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoritesMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0){
      _favoritesMeals.removeAt(existingIndex);
    }
    else{
      _favoritesMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
    }
  }

  bool isMealFavorites(String id){
    return _favoritesMeals.any((element) => element.id==id);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ))),
      //home: CategoryScreens(),
      routes: {
        '/': (context) => TabScreen(_favoritesMeals),
        CategoryMeal.routName: (context) => CategoryMeal(_availableMeals),
        MealDetails.routeName: (context) => MealDetails(_toggleFavorites,isMealFavorites),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
