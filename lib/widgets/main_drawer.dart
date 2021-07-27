import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(IconData tileIcon , String tileName,Function tileFun ) {
    return ListTile(
        onTap: tileFun,
        leading: Icon(
          tileIcon,
          size: 20,
        ),
        title: Text(
          tileName,
          style: TextStyle(
              fontSize: 42,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        child: Column(
          children: [
            Container(
                color: Theme.of(context).accentColor,
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cooking Up",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                )),
            SizedBox(
              height: 20,
            ),
            // ListTile(
            //   onTap: () {},
            //   leading: Icon(
            //     Icons.restaurant,
            //     size: 20,
            //   ),
            //   title: Text(
            //     "Meal",
            //     style: TextStyle(
            //         fontSize: 42,
            //         fontFamily: 'RobotoCondensed',
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // ListTile(
            //   onTap: () {},
            //   leading: Icon(
            //     Icons.settings,
            //     size: 20,
            //   ),
            //   title: Text(
            //     "Filters",
            //     style: TextStyle(
            //         fontSize: 42,
            //         fontFamily: 'RobotoCondensed',
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            buildListTile(Icons.restaurant, "Meal", (){Navigator.of(context).pushReplacementNamed("/");}),
            buildListTile(Icons.settings, "Filters", (){Navigator.of(context).pushReplacementNamed("/filters");}),
          ],
        ),
      ),
    );
  }
}
