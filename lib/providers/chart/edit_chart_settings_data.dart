import 'package:fling_units/fling_units.dart';

class EditChartSettingsData {
  final String startValue;
  final String endValue;
  final Unit<Mass> massUnit;
  final Unit<Distance> schwarzschildRadiusUnit;
  final Unit<Time> lifetimeUnit;

  EditChartSettingsData({
    required this.startValue,
    required this.endValue,
    required this.massUnit,
    required this.schwarzschildRadiusUnit,
    required this.lifetimeUnit,
  });
}
