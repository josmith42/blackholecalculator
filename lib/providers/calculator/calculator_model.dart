
import 'package:fling_units/fling_units.dart';

class CalculatorViewModel {
  final MassMeasurement mass;
  String get massValue => mass.defaultValue.toString();

  CalculatorViewModel({required this.mass});

  CalculatorViewModel copyWith({
    MassMeasurement? mass,
  }) {
    return CalculatorViewModel(
      mass: mass ?? this.mass,
    );
  }
}