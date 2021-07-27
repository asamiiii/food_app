import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meel_app/widgets/meal_Item.dart';
import '../modules/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals ;


  FavoritesScreen(this.favoritesMeals);
  //const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favoritesMeals.isEmpty){
      return Center(child: Text("you have no favorites yet.!!",style: Theme.of(context).textTheme.headline6,),);
    }
    else
    return ListView.builder(
        itemBuilder: (BuildContext ctx, index) {
          return MealItem(
            id:favoritesMeals[index].id,
            imageUrl :favoritesMeals[index].imageUrl,
            title :favoritesMeals[index].title,
            duration:favoritesMeals[index].duration,
            complexity:favoritesMeals[index].complexity,
            affordability:favoritesMeals[index].affordability,


          );
        },
        itemCount: favoritesMeals.length);
  }
}

