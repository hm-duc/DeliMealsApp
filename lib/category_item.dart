import 'package:flutter/material.dart';

import 'cetegory_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem({this.id, this.title, this.color});

  void selectCatgory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/category-meal',
        arguments: {'categoryId': id, 'catgoryTitle': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatgory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[color.withOpacity(0.7), color],
              ),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
