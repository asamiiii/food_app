import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../screens/meal_details.dart';

class MealItem extends StatelessWidget {
  //const MealItem({Key key}) : super(key: key);
  
  final String imageUrl;
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,

  });

  String get complexityText{
    if (complexity==Complexity.Simple) return "Simple";
    else if (complexity==Complexity.Hard) return "Hard";
    else if (complexity==Complexity.Challenging) return "Challenging";
    else  return "Unknown";
  }
  String get affordabilityText{
    if (affordability==Affordability.Affordable) return "Affordable";
    else if (affordability==Affordability.Luxurious) return "Luxurious";
    else if (affordability==Affordability.Pricey) return "Pricey";
    else  return "Unknown";
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName,
        arguments:id).then((value) {
         // if(value != null) return removeItem(value);
     })
    ;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: ()=>selectMeal(context),
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(imageUrl),
                  ),
                  Positioned(
                    bottom:  20,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.black38,
                      width: 250,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20,color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround ,
                  children: [
                    Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text("$duration min")
                    ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6,),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6,),
                        Text(affordabilityText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
