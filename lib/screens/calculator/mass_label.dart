
import 'package:fling_units/fling_units.dart';

enum MassLabel {
    grams(MassUnit.grams),
    tonnes(MassUnit.tonnes);


  final MassUnit unit;
  String get label => unit.name;

  const MassLabel(this.unit);

  static MassLabel from(Unit<Mass> unit) {
    return MassLabel.values.firstWhere(
      (label) => label.unit == unit,
      orElse: () => MassLabel.grams,
    );
  }
}