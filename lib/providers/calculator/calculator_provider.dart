
import 'package:blackholecalculator/providers/calculator/calculator_model.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorNotifier extends StateNotifier<CalculatorViewModel> {
  CalculatorNotifier() : super(CalculatorViewModel(mass: 0.kilo.grams));

  void setMassValue(String userValue) {
    final value = double.tryParse(userValue);
    if (value == null) return; // todo handle error
    state = state.copyWith(mass: MassMeasurement(value, state.mass.defaultUnit));
  }

  void setMassUnit(Unit<Mass>? unit) {
    if (unit == null) return;
    state = state.copyWith(
      mass: state.mass.butAs(unit) as MassMeasurement,
    );
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorViewModel>((ref) {
  return CalculatorNotifier();
});

