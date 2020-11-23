import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilttersScreen extends StatefulWidget {
  static const routeName = '/filtters';

  @override
  _FilttersScreenState createState() => _FilttersScreenState();
}

class _FilttersScreenState extends State<FilttersScreen> {
  var _glutenFree = false;
  var _vegarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('Gluten-free', _glutenFree,
                    'Only include Gluten-free meals',() {
                  _glutenFree = !_glutenFree;
                }),
                buildSwitchListTile('Vegarian', _vegarian,
                    'Only include Vegarian meals',() {
                  _vegarian = !_vegarian;
                }),
                buildSwitchListTile('Vagan', _vegan,
                    'Only include Vagan meals',() {
                  _vegan = !_vegan;
                }),
                buildSwitchListTile('Lactose-free', _lactoseFree,
                    'Only include Lactose-free meals', () {
                  _lactoseFree = !_lactoseFree;
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, var currentValue, String subTitle, Function changeValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: (newValue) {
        setState(() {
          changeValue();
        });
      },
    );
  }
}
