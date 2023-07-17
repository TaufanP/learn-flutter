import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FiltersNotifier extends StateNotifier<List<MealFilter>> {
  FiltersNotifier() : super([]);

  void setFilters(List<MealFilter> filters) {
    state = filters;
  }

  void onToggle(MealFilter mealFilter, bool isChecked) {
    final bool isExist = state.contains(mealFilter);
    if (isExist && !isChecked) {
      state = state.where((element) => element != mealFilter).toList();
    } else {
      state = [...state, mealFilter];
    }
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, List<MealFilter>>(
        (ref) => FiltersNotifier());
