
import 'package:fling_units/fling_units.dart';

class EditChartSettingsData<T extends Dimension> {
  final String startValue;
  final String endValue;
  final Unit<T> unit;

  EditChartSettingsData({
    required this.startValue,
    required this.endValue,
    required this.unit,
  });
}