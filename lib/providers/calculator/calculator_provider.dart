import 'package:blackholecalculator/calc/formulas.dart';
import 'package:blackholecalculator/calc/solar_mass.dart';
import 'package:blackholecalculator/providers/calculator/calculator_model.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorNotifier extends StateNotifier<CalculatorViewModel> {
  CalculatorNotifier()
    : super(
        CalculatorViewModel(
          mass: 0.0.solarMasses,
          schwarzschildRadius: 0.0.meters,
        ),
      );

  void setMassValue(String userValue) {
    final value = double.tryParse(userValue);
    if (value == null) return; // todo handle errormass
    _updateValuesFromMass(MassMeasurement(value, state.mass.defaultUnit));
    state = state.copyWith(
      mass: MassMeasurement(value, state.mass.defaultUnit),
    );
  }

  void setMassUnit(Unit<Mass>? unit) {
    if (unit == null) return;
    state = state.copyWith(mass: state.mass.butAs(unit));
  }

  void setSchwarzschildRadiusValue(String userValue) {
    final value = double.tryParse(userValue);
    if (value == null) return; // todo handle error
    state = state.copyWith(
      schwarzschildRadius: DistanceMeasurement(
        value,
        state.schwarzschildRadius.defaultUnit,
      ),
    );
  }

  void setSchwarzschildRadiusUnit(Unit<Distance>? unit) {
    if (unit == null) return;
    state = state.copyWith(
      schwarzschildRadius: state.schwarzschildRadius.butAs(unit),
    );
  }

  void _updateValuesFromMass(Measurement<Mass> newMass) {
    final schwarzschildRadius = schwarzschildRadiusFormula(newMass);
    state = state.copyWith(
      mass: newMass,
      schwarzschildRadius: schwarzschildRadius.butAs(state.schwarzschildRadius.defaultUnit),
    );
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorViewModel>((ref) {
      return CalculatorNotifier();
    });
