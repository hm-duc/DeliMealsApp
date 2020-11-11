import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catgoryTitle = routeArgs['catgoryTitle'];
    final categoryId = routeArgs['categoryId'];
    return Scaffold(
      appBar: AppBar(
        title: Text(catgoryTitle),
      ),
      body: Center(
        child: Text('The Recipes for catefories!'),
      ),
    );
  }
}
