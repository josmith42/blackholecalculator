

import 'package:fling_units/fling_units.dart';

class SolarMass extends Unit<Mass> {
  const SolarMass()
    : super(
        name: 'M☉',
        unitMultiplier: 1.988416e33, // grams - https://en.wikipedia.org/wiki/Solar_mass
        prefix: const MeasurementPrefix.unit(),
      );
}

const _solarMasses = SolarMass();
const solarMasses = _solarMasses;

extension SolarMassExtension on num {
  MassMeasurement get solarMasses => MassMeasurement(this, _solarMasses);
}