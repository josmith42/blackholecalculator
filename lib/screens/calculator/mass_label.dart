
import 'package:fling_units/fling_units.dart';

enum MassLabel {
    kilograms,
    tonnes;

  static MassLabel? from(Unit<Mass> unit) {
    return MassLabel.values.firstWhere(
      (label) => label.unit == unit,
    );
  }
}

extension MassLabelExtension on MassLabel {
  Unit<Mass> get unit => switch (this) {
      MassLabel.kilograms => kilo.grams,
      MassLabel.tonnes => tonnes,
  };
  String get label => unit.toString();
}