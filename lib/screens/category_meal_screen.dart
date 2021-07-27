import 'package:flutter/material.dart';
import 'package:meel_app/modules/meal.dart';
import '../dummy_data.dart';
import 'package:meel_app/widgets/meal_Item.dart';

class CategoryMeal extends StatefulWidget {
  //const CategoryMeal({Key key}) : super(key: key);
  static const routName = "Category_meal";
final List<Meal> availableMeals;


  CategoryMeal(this.availableMeals);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  String categoryTitle;
  List<Meal> categoryMeal;

  @override
  void didChangeDependencies() {
    final routArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    categoryMeal = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){
    setState(() {
      categoryMeal.removeWhere((element) => element.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    // final routArg =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryId = routArg['id'];
    // final categoryTitle = routArg['title'];
    // final categoryMeal = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext ctx, index) {
            return MealItem(
              id:categoryMeal[index].id,
              imageUrl :categoryMeal[index].imageUrl,
              title :categoryMeal[index].title,
              duration:categoryMeal[index].duration,
              complexity:categoryMeal[index].complexity,
              affordability:categoryMeal[index].affordability,


            );
          },
          itemCount: categoryMeal.length),
    );
  }
}
