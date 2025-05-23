import 'package:blackholecalculator/calc/unit_lists.dart';
import 'package:blackholecalculator/providers/app/app_bar_provider.dart';
import 'package:blackholecalculator/providers/calculator/calculator_provider.dart';
import 'package:blackholecalculator/screens/calculator/calculator_row.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appBarProvider.notifier).setActions([]);
    final calculatorModel = ref.watch(calculatorProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          CalculatorRow<Mass>(
            title: "Mass",
            measurement: calculatorModel.mass,
            units: massUnitsList,
            onValueChanged:
                (value) => ref.calculatorNotifier.setMassValue(value),
            onUnitChanged: (unit) => ref.calculatorNotifier.setMassUnit(unit),
          ),
          CalculatorRow<Distance>(
            title: "Schwarzschild radius",
            measurement: calculatorModel.schwarzschildRadius,
            units: distanceUnitsList,
            onValueChanged:
                (value) =>
                    ref.calculatorNotifier.setSchwarzschildRadiusValue(value),
            onUnitChanged:
                (unit) =>
                    ref.calculatorNotifier.setSchwarzschildRadiusUnit(unit),
          ),
          CalculatorRow<Time>(
            title: "Lifetime",
            measurement: calculatorModel.lifetime,
            units: timeUnitsList,
            onValueChanged:
                (value) => ref.calculatorNotifier.setLifetimeValue(value),
            onUnitChanged:
                (unit) => ref.calculatorNotifier.setLifetimeUnit(unit),
          ),
        ],
      ),
    );
  }
}

extension _NotifierExtension on WidgetRef {
  CalculatorNotifier get calculatorNotifier =>
      read(calculatorProvider.notifier);
}
