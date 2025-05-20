import 'package:fling_units/fling_units.dart';

class CalculatorViewModel {
  final Measurement<Mass> mass;
  final Measurement<Distance> schwarzschildRadius;

  CalculatorViewModel({required this.mass, required this.schwarzschildRadius});

  CalculatorViewModel copyWith({
    Measurement<Mass>? mass,
    Measurement<Distance>? schwarzschildRadius,
  }) {
    return CalculatorViewModel(
      mass: mass ?? this.mass,
      schwarzschildRadius: schwarzschildRadius ?? this.schwarzschildRadius,
    );
  }
}

extension MeasurementExtension<T extends Dimension> on Measurement<T> {
  String get defaultValueText => defaultValue.toString();
}
