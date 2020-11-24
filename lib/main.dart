import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/cetegory_meal_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> _fliters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vagetarian': false,
  };
  List<Meal> _avaiableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, dynamic> filterData) {
    setState(() {
      _fliters = filterData;
      _avaiableMeals = DUMMY_MEALS.where((element) {
        if (_fliters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_fliters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_fliters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_fliters['vagetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      routes: {
        TabScreen.routeName: (context) => TabScreen(),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_avaiableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilttersScreen.routeName: (context) => FilttersScreen(_fliters,_setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TabScreen());
      },
    );
  }
}
