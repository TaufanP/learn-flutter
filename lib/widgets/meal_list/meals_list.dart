import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_list/meal_item.dart';

class MealsList extends StatelessWidget {
  const MealsList(this.meals, {super.key});

  final List<Meal> meals;

  void _onTapMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          meal: meal,
        ),
      ),
    );
  }

  Widget itemBuilder(ctx, index) {
    return MealItem(
      meals[index],
      onTap: () {
        _onTapMeal(ctx, meals[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: meals.length,
    );
  }
}
