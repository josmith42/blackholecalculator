import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';

class BhDropdownMenu<T extends Dimension> extends StatelessWidget {
  const BhDropdownMenu({
    super.key,
    required this.unitsList,
    required this.initialSelection,
    required this.title,
    required this.onUnitChanged,
    this.width,
  });

  final List<Unit<T>> unitsList;
  final Unit<T> initialSelection;
  final String title;
  final void Function(Unit<T>) onUnitChanged;
  final double? width;

  @override
  Widget build(BuildContext context) => DropdownMenu<Unit<T>>(
    initialSelection: initialSelection,
    width: width,
    label: Text(title),
    dropdownMenuEntries:
        unitsList
            .map(
              (unit) => DropdownMenuEntry<Unit<T>>(
                label: unit.toString(),
                value: unit,
              ),
            )
            .toList(),
    onSelected: (value) {
      if (value == null) return;
      onUnitChanged(value);
    },
  );
}
