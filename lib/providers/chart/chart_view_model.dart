import 'package:blackholecalculator/calc/formulas.dart';
import 'package:blackholecalculator/providers/chart/chart_data.dart';
import 'package:fling_units/fling_units.dart';


class ChartViewModel {
  final Measurement<Mass> startMass;
  final Measurement<Mass> endMass;
  late final ChartData<Distance> schwarzchildChartData;
  late final ChartData<Time> lifetimeChartData;

  ChartViewModel({
    required this.startMass,
    required this.endMass,
    required Unit<Distance> schwarzschildRadiusUnit,
    required Unit<Time> lifetimeUnit,
  }) {
    schwarzchildChartData = ChartData<Distance>(
      title: 'Mass vs Schwarzschild Radius',
      startMass: startMass,
      endMass: endMass,
      dependentLabel: 'Schwarzschild Radius',
      dependentUnit: schwarzschildRadiusUnit,
      dependentValueFromMass: schwarzschildRadiusFromMass,
    );
    lifetimeChartData = ChartData<Time>(
      title: 'Mass vs Lifetime',
      startMass: startMass,
      endMass: endMass,
      dependentLabel: 'Lifetime',
      dependentUnit: lifetimeUnit,
      dependentValueFromMass: lifetimeFromMass,
    );
  }
}
