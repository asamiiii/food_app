import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItems extends StatelessWidget {
  //const CategoryItems({Key key}) : super(key: key);

  final String id;
  final String title;
  final Color color;

  CategoryItems(this.id, this.title, this.color);

  void onClickedItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeal.routName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return Material(

      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
        onTap: () {
          onClickedItem(context);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.4), color]),
              color: color,
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
