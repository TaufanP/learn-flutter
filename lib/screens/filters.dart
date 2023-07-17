import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  List<MealFilter> filterList = [];

  void _onChanged(MealFilter mealFilter, bool isChecked) {
    final bool isExist = filterList.contains(mealFilter);
    if (isExist && !isChecked) {
      setState(() {
        filterList.remove(mealFilter);
      });
    } else {
      setState(() {
        filterList.add(mealFilter);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    final activeFilters = ref.read(filtersProvider);

    filterList = activeFilters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters(filterList);
          return true;
        },
        child: Column(
          children: [
            FilterItem(
              'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              value: filterList.contains(MealFilter.glutenFree),
              onChanged: (isChecked) {
                _onChanged(MealFilter.glutenFree, isChecked);
              },
            ),
            FilterItem(
              'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              value: filterList.contains(MealFilter.lactoseFree),
              onChanged: (isChecked) {
                _onChanged(MealFilter.lactoseFree, isChecked);
              },
            ),
            FilterItem(
              'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              value: filterList.contains(MealFilter.vegetarian),
              onChanged: (isChecked) {
                _onChanged(MealFilter.vegetarian, isChecked);
              },
            ),
            FilterItem(
              'Vegan',
              subtitle: 'Only include vegan meals.',
              value: filterList.contains(MealFilter.vegan),
              onChanged: (isChecked) {
                _onChanged(MealFilter.vegan, isChecked);
              },
            ),
          ],
        ),
      ),
    );
  }
}
