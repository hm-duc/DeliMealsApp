import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Drawer here!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed(TabScreen.routeName);
          }),
          buildListTile('Filter', Icons.settings, () {
            Navigator.of(context).pushNamed(FilttersScreen.routeName);
          })
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, Function handleSelect) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      onTap: handleSelect,
      title: Text(title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold)),
    );
  }
}
