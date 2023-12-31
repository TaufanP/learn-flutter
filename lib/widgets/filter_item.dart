import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(this.title,
      {super.key,
      required this.subtitle,
      required this.value,
      required this.onChanged});

  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool isChecked) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 32,
        right: 24,
      ),
    );
  }
}
