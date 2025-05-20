
import 'package:fling_units/fling_units.dart';

class CalculatorViewModel {
  final Measurement<Mass> mass;

  CalculatorViewModel({required this.mass});

  CalculatorViewModel copyWith({
    Measurement<Mass>? mass,
  }) {
    return CalculatorViewModel(
      mass: mass ?? this.mass,
    );
  }
}

extension MeasurementExtension<T extends Dimension> on Measurement<T> {
  String get defaultValueText => defaultValue.toString();
}