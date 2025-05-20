import 'package:blackholecalculator/calc/astronomical_unit.dart';
import 'package:blackholecalculator/calc/earth_mass.dart';
import 'package:blackholecalculator/calc/light_year.dart';
import 'package:blackholecalculator/calc/planck_length.dart';
import 'package:blackholecalculator/calc/planck_mass.dart';
import 'package:blackholecalculator/calc/planck_time.dart';
import 'package:blackholecalculator/calc/solar_mass.dart';
import 'package:blackholecalculator/calc/years.dart';
import 'package:blackholecalculator/providers/calculator/calculator_provider.dart';
import 'package:blackholecalculator/screens/calculator/calculator_row.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorModel = ref.watch(calculatorProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          CalculatorRow<Mass>(
            title: "Mass",
            measurement: calculatorModel.mass,
            units: [planckMasses, kilo.grams, tonnes, earthMasses, solarMasses],
            onValueChanged:
                (value) => ref.calculatorNotifier.setMassValue(value),
            onUnitChanged: (unit) => ref.calculatorNotifier.setMassUnit(unit),
          ),
          CalculatorRow<Distance>(
            title: "Schwarzschild radius",
            measurement: calculatorModel.schwarzschildRadius,
            units: [
              planckLengths,
              nano.meters,
              meters,
              kilo.meters,
              miles,
              astronomicalUnits,
              lightYears,
            ],
            onValueChanged:
                (value) =>
                    ref.calculatorNotifier.setSchwarzschildRadiusValue(value),
            onUnitChanged:
                (unit) =>
                    ref.calculatorNotifier.setSchwarzschildRadiusUnit(unit),
          ),
          CalculatorRow(
            title: "Lifetime",
            measurement: calculatorModel.lifetime,
            units: [planckTimes, seconds, minutes, hours, days, years],
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
