
import 'package:fling_units/fling_units.dart';

class AstronomicalUnit extends Unit<Distance> {
  const AstronomicalUnit()
      : super(
          name: 'AU',
          unitMultiplier: 149_597_870_700.0, // meters - https://en.wikipedia.org/wiki/Astronomical_unit
          prefix: const MeasurementPrefix.unit(),
        );
}

const _astronomicalUnits = AstronomicalUnit();
const astronomicalUnits = _astronomicalUnits;
extension AstronomicalUnitExtension on num {
  DistanceMeasurement get astronomicalUnits => DistanceMeasurement(this, _astronomicalUnits);
}