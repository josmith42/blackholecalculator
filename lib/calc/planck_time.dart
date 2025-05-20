
import 'package:fling_units/fling_units.dart';

class PlanckTime extends Unit<Time>{
  const PlanckTime()
      : super(
          name: 'tP',
          unitMultiplier: 5.391247e-44, // seconds - https://en.wikipedia.org/wiki/Planck_time
          prefix: const MeasurementPrefix.unit(),
        );
}

const _planckTimes = PlanckTime();
const planckTimes = _planckTimes;
extension PlanckTimeExtension on num {
  TimeMeasurement get planckTimes => TimeMeasurement(this, _planckTimes);
}