import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.title, required this.meals, super.key});

  final String title;
  final List<Meal> meals;

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isEmpty
          ? const Text('Try adding a meal!')
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                return MealItem(
                  meal: meals[index],
                  onSelectMeal: (meal) {
                    onSelectMeal(context, meal);
                  },
                );
              },
            ),
    );
  }
}
