import 'package:fling_units/fling_units.dart';

class CalculatorViewModel {
  final Measurement<Mass> mass;
  final Measurement<Distance> schwarzschildRadius;
  final Measurement<Time> lifetime;

  CalculatorViewModel({
    required this.mass,
    required this.schwarzschildRadius,
    required this.lifetime,
  });

  CalculatorViewModel copyWith({
    Measurement<Mass>? mass,
    Measurement<Distance>? schwarzschildRadius,
    Measurement<Time>? lifetime,
  }) {
    return CalculatorViewModel(
      mass: mass ?? this.mass,
      schwarzschildRadius: schwarzschildRadius ?? this.schwarzschildRadius,
      lifetime: lifetime ?? this.lifetime,
    );
  }
}

extension MeasurementExtension<T extends Dimension> on Measurement<T> {
  String get defaultValueText => defaultValue.toString();
}
