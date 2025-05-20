
import 'package:fling_units/fling_units.dart';

class Years extends Unit<Time> {
  const Years()
      : super(
          name: 'yr',
          unitMultiplier: 3.1556926e7,
          prefix: const MeasurementPrefix.unit(),
        );
}

const _years = Years();
const years = _years;
extension YearsExtension on num {
  TimeMeasurement get years => TimeMeasurement(this, _years);
}