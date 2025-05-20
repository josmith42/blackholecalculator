
import 'package:fling_units/fling_units.dart';

class PlanckLength extends Unit<Distance> {
  const PlanckLength()
      : super(
          name: 'ℓp',
          unitMultiplier: 1.616255e-35, // meters - https://en.wikipedia.org/wiki/Planck_length
          prefix: const MeasurementPrefix.unit(),
        );
}

const _planckLengths = PlanckLength();
const planckLengths = _planckLengths;
extension PlanckLengthExtension on num {
  DistanceMeasurement get planckLengths => DistanceMeasurement(this, _planckLengths);
}