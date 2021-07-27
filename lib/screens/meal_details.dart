import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meel_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  //const MealDetails({Key key}) : super(key: key);
  static const routeName = 'mealDetail';
  final Function toggleFavorites;
  final Function isMealFavorites;

  MealDetails(this.toggleFavorites, this.isMealFavorites);

  Widget buildTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildConta(Widget child) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 150,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final idDetails = ModalRoute.of(context).settings.arguments as String;
    final selectMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == idDetails);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ), //Image
            buildTitle(context, "Ingredients"),
            buildConta(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectMeal.ingredients[index],
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildTitle(context, "Steps"),
            buildConta(
              ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(selectMeal.steps[index]),
                  leading: CircleAvatar(
                    child: Text('${index+1}'),
                  ),
                ),
                itemCount: selectMeal.steps.length-1,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isMealFavorites(idDetails) ? Icons.star:Icons.star_border,
        ),
        onPressed:()=> toggleFavorites(idDetails),
      ),
    );
  }
}
