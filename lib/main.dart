import 'package:flutter/material.dart';
import './pages/meals/meal_detail.dart';
import './pages/meals/meals.dart';
import './pages/categories/categories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliFood',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesScreen(),
      initialRoute: '/home',
      routes: {
          '/home': (ctx) => CategoriesScreen(),
          MealsPage.routeName: (ctx) => MealsPage(),
          MealDetailPage.routeName: (ctx) => MealDetailPage(),
      },
      onUnknownRoute: (settings) {
          return MaterialPageRoute( builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
