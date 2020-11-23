import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 2 -
            200 -
            MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width - 100,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meailId = ModalRoute.of(context).settings.arguments as String;
    final mealInfo = DUMMY_MEALS.firstWhere((element) => element.id == meailId);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealInfo.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height / 3) -
                  MediaQuery.of(context).padding.top,
              width: double.infinity,
              child: Image.network(
                mealInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: mealInfo.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(mealInfo.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
                context,
                ListView.builder(
                  itemCount: mealInfo.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(mealInfo.steps[index]),
                      ),
                      Divider()
                    ],
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealInfo.id);
        },
      ),
    );
  }
}
