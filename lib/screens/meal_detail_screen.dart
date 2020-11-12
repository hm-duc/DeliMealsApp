import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final dataRoute = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final meailId = dataRoute['idMeal'];
    final titleMeal = dataRoute['titleMeal'];
    return Scaffold(
      appBar: AppBar(title: Text(titleMeal),),
      body: Center(
        child: Text('The meal - $meailId!'),
      ),
    );
  }
}
