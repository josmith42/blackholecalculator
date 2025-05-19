import 'package:fling_units/fling_units.dart';

enum MassLabel {
  kilograms,
  tonnes,
  solarMasses;

  static MassLabel? from(Unit<Mass> unit) {
    return MassLabel.values.firstWhere((label) => label.unit == unit);
  }
}

extension MassLabelExtension on MassLabel {
  Unit<Mass> get unit => switch (this) {
    MassLabel.kilograms => kilo.grams,
    MassLabel.tonnes => tonnes,
    MassLabel.solarMasses => solarMasses,
  };
  String get label => unit.toString();
}

class SolarMass extends Unit<Mass> {
  const SolarMass()
    : super(
        name: 'M☉',
        unitMultiplier: 1.9885e33,
        prefix: const MeasurementPrefix.unit(),
      );
}

const solarMasses = SolarMass();