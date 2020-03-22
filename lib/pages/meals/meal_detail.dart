import 'package:flutter/material.dart';
import './../misc/models.dart';
import './../misc/dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.title),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealDetail.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        mealDetail.ingredients[index],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  itemCount: mealDetail.ingredients.length,
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(
                    mealDetail.steps[index],
                  ),
                ),
                itemCount: mealDetail.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
