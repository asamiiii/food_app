import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_Item.dart';

class CategoryScreens extends StatelessWidget {
  //const CategoryScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text("meal"),),
      body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((value) =>
          //Text(value.title,style: TextStyle(fontSize: 15,color: Colors.black,),),
          CategoryItems(value.id,value.title,value.color),
          ).toList(),

          // RaisedButton(onPressed: (){}, child: null,color: Colors.orange,),
          // RaisedButton(onPressed: (){}, child: null,color: Colors.orange,),
          // RaisedButton(onPressed: (){}, child: null,color: Colors.orange,),
          // RaisedButton(onPressed: (){}, child: null,color: Colors.orange,),
          // RaisedButton(onPressed: (){}, child: null,color: Colors.orange,),
          // RaisedButton(onPressed: (){}, child: null,color: Colors.orange,),

          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 3/2
      ),

      ),
    );
  }
}
