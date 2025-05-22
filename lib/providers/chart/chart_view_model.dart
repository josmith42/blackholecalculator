import 'package:blackholecalculator/calc/formulas.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fling_units/fling_units.dart';

const int chartPointsCount = 100;

class ChartViewModel {
  final Measurement<Mass> startMass;
  final Measurement<Mass> endMass;
  late final List<FlSpot> chartData;

  ChartViewModel({required this.startMass, required this.endMass}) {
    final interval = (endMass - startMass) / 100;
    chartData = List.generate(chartPointsCount, (i) {
      final value = startMass + (interval * i);
      return FlSpot(
        value.defaultValue,
        schwarzschildRadiusFromMass(value).butAs(kilo.meters).defaultValue,
      );
    });
  }
}
