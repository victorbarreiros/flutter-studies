import 'package:flutter/material.dart';
import './dummy_data.dart';

import './models/meal.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TODO Move Filters to a class on its own
  Map<String, bool> _filters = {
    'vegan': false,
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This will rebuild the entire app everytime a meal is favorited
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

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
        '/': (context) => TabsScreen(_favoritedMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_isMealFavorite, _toggleFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
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
