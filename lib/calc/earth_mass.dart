
import 'package:fling_units/fling_units.dart';

class EarthMass extends Unit<Mass> {
  const EarthMass()
      : super(
          name: 'M⊕',
          unitMultiplier: 5.972e27, // grams - https://en.wikipedia.org/wiki/Earth_mass
          prefix: const MeasurementPrefix.unit(),
        );

}

const _earthMasses = EarthMass();
const earthMasses = _earthMasses;
extension EarthMassExtension on num {
  MassMeasurement get earthMasses => MassMeasurement(this, _earthMasses);
}