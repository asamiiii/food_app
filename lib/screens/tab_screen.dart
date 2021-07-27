import 'package:flutter/material.dart';
import 'package:meel_app/modules/meal.dart';
import 'package:meel_app/screens/category_screens.dart';
import '../widgets/main_drawer.dart';
import '../screens/category_meal_screen.dart';
import '../screens/favorites_sec.dart';

class TabScreen extends StatefulWidget {
  //const TabScreen({Key key}) : super(key: key);
final List<Meal> _favoritesMeals ;


TabScreen(this._favoritesMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String,Object>> _pages ;

  @override
  initState()
  {
    _pages=[
    {
    'page': CategoryScreens(),
    'title': 'Categories'
    },
    {
    'page': FavoritesScreen(widget._favoritesMeals),
    'title': 'Your Favorites'
    }
    ];
    super.initState();
  }

  int selectedIndex = 0;

  void _selectedPage(int value) {
    setState(() {
      selectedIndex = value ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[selectedIndex]['title']),),
      body: _pages[selectedIndex]['page'],
       bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Theme.of(context).primaryColor,
         currentIndex: selectedIndex,
         selectedItemColor: Theme.of(context).accentColor,
         unselectedItemColor: Colors.white,
         onTap: _selectedPage,
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.category),label:"Categories" ),
           BottomNavigationBarItem(icon: Icon(Icons.star),label:"Favorites" ),
         ],
       ),
      drawer: MainDrawer(),
    );

  }
}
