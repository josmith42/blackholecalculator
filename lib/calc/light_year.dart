

import 'package:fling_units/fling_units.dart';

class LightYear extends Unit<Distance> {
  const LightYear()
      : super(
          name: 'ly',
          unitMultiplier: 9.461e15,
          prefix: const MeasurementPrefix.unit(),
        );
}

const _lightYears = LightYear();
const lightYears = _lightYears;
extension LightYearExtension on double {
  DistanceMeasurement get lightYears => DistanceMeasurement(this, _lightYears);
}