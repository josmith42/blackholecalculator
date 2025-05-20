
import 'package:fling_units/fling_units.dart';

class PlanckMass extends Unit<Mass> {
  const PlanckMass()
      : super(
          name: 'Mₚ',
          unitMultiplier: 2.176434e-5, // grams - https://en.wikipedia.org/wiki/Planck_mass
          prefix: const MeasurementPrefix.unit(),
        );
}
const _planckMasses = PlanckMass();
const planckMasses = _planckMasses;
extension PlanckMassExtension on num {
  MassMeasurement get planckMasses => MassMeasurement(this, _planckMasses);
}