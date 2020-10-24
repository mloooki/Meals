// This screen to show the meals for the choosen category.

import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  CategoryMealScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
