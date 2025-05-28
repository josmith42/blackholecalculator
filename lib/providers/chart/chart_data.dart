import 'package:fl_chart/fl_chart.dart';
import 'package:fling_units/fling_units.dart';

const int chartPointsCount = 100;

class ChartData<T extends Dimension> {
  final String title;
  final Measurement<Mass> startMass;
  final Measurement<Mass> endMass;
  final String dependentLabel;
  final Unit<T> dependentUnit;
  final List<FlSpot> data;
  final double yInterval;

  ChartData({
    required this.title,
    required this.startMass,
    required this.endMass,
    required this.dependentLabel,
    required this.dependentUnit,
    required this.data,
    required this.yInterval,
  });

  factory ChartData.withDependentFunction({
    required String title,
    required Measurement<Mass> startMass,
    required Measurement<Mass> endMass,
    required String dependentLabel,
    required Unit<T> dependentUnit,
    required Measurement<T> Function(Measurement<Mass>) dependentValueFromMass,
  }) {
    final xInterval = (endMass - startMass) / chartPointsCount;
    final data = List.generate(chartPointsCount, (i) {
      final value = startMass + (xInterval * i);
      return FlSpot(
        value.defaultValue,
        dependentValueFromMass(value).butAs(dependentUnit).defaultValue,
      );
    });
    final yInterval = (data.max() - data.min()) / 5;
    return ChartData(
      title: title,
      startMass: startMass,
      endMass: endMass,
      dependentLabel: dependentLabel,
      dependentUnit: dependentUnit,
      yInterval: yInterval,
      data: data,
    );
  }
}

extension FlSpotExtensions on List<FlSpot> {
  double min() {
    return map((e) => e.y).reduce((curr, next) => curr < next ? curr : next);
  }

  double max() {
    return map((e) => e.y).reduce((curr, next) => curr > next ? curr : next);
  }
}
