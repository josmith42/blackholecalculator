

import 'package:fling_units/fling_units.dart';

class SolarMass extends Unit<Mass> {
  const SolarMass()
    : super(
        name: 'M☉',
        unitMultiplier: 1.9885e33,
        prefix: const MeasurementPrefix.unit(),
      );
}

const _solarMasses = SolarMass();
const solarMasses = _solarMasses;

extension SolarMassExtension on num {
  MassMeasurement get solarMasses => MassMeasurement(this, _solarMasses);
}