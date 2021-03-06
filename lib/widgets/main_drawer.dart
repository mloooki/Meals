import 'package:flutter/material.dart';

import 'package:meals/screens/filter_screen.dart';

import 'package:meals/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTilee(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
          buildListTilee(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) {
                  return TabScreen();
                }),
              );
            },
          ),
          buildListTilee(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) {
                  return FiltersScreen();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
