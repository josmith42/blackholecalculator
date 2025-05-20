import 'package:fling_units/fling_units.dart';
import 'package:blackholecalculator/calc/solar_mass.dart';

enum MassLabel {
  kilograms,
  tonnes,
  solarMasses;

  static MassLabel? from(Unit<Mass> unit) {
    return MassLabel.values.firstWhere((label) => label.unit == unit, orElse: () => throw ArgumentError('Could not find MassLabel for unit: $unit'));
  }
}

extension MassLabelExtension on MassLabel {
  Unit<Mass> get unit => switch (this) {
    MassLabel.kilograms => kilo.grams,
    MassLabel.tonnes => tonnes,
    MassLabel.solarMasses => solarMass,
  };

  String get label => unit.toString();
}