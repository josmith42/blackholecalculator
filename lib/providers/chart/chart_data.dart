import 'package:fl_chart/fl_chart.dart';
import 'package:fling_units/fling_units.dart';

const int chartPointsCount = 100;

class ChartData<T extends Dimension> {
  final String title;
  final Measurement<Mass> startMass;
  final Measurement<Mass> endMass;
  final String dependentLabel;
  final Unit<T> dependentUnit;
  late final List<FlSpot> data;

  ChartData({
    required this.title,
    required this.startMass,
    required this.endMass,
    required this.dependentLabel,
    required this.dependentUnit,
    required Measurement<T> Function(Measurement<Mass>) dependentValueFromMass,
  }) {
    final interval = (endMass - startMass) / chartPointsCount;
    data = List.generate(chartPointsCount, (i) {
      final value = startMass + (interval * i);
      return FlSpot(
        value.defaultValue,
        dependentValueFromMass(value).butAs(dependentUnit).defaultValue,
      );
    });
  }
}
