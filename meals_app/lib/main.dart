import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.amber,
            ),
        // primarySwatch: Colors.pink,
        // accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
      onGenerateRoute: ((settings) {
        // in case a named route is not found, defaults here.
        // It takes a function which executes for any named navigation action (= `pushNamed()`)
        // for which no registered route was found in the routes table.
        // You should return a navigation action (e.g. `MaterialPageRoute`) in `onGenerateRoute`.
        // `onGenerateRoute` executes for any unregistered named route,
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      }),
      onUnknownRoute: ((settings) {
        // used in case nothing is found instead of crashing goes here.
        // `onUnknownRoute` executes if onGenerateRoute isn't defined or doesn't return a valid navigation action.
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      }),
    );
  }
}
