import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.title, required this.meals, super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isEmpty
          ? const Text('Try adding a meal!')
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: (meals[index].isVegan || meals[index].isVegetarian)
                      ? Colors.green
                      : Colors.grey,
                  child: Column(
                    children: [Text(meals[index].title)],
                  ),
                );
              },
            ),
    );
  }
}
