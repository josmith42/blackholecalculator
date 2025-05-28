import 'package:blackholecalculator/calc/formulas.dart';
import 'package:blackholecalculator/providers/chart/chart_data.dart';
import 'package:fling_units/fling_units.dart';

class ChartViewModel {
  final Measurement<Mass> startMass;
  final Measurement<Mass> endMass;
  final ChartData<Distance> schwarzchildChartData;
  final ChartData<Time> lifetimeChartData;

  ChartViewModel({
    required this.startMass,
    required this.endMass,
    required this.schwarzchildChartData,
    required this.lifetimeChartData,
  });

  factory ChartViewModel.withDependentUnits({
    required Measurement<Mass> startMass,
    required Measurement<Mass> endMass,
    required Unit<Distance> schwarzschildRadiusUnit,
    required Unit<Time> lifetimeUnit,
  }) {
    final schwarzchildChartData = ChartData<Distance>.withDependentFunction(
      title: 'Mass vs Schwarzschild Radius',
      startMass: startMass,
      endMass: endMass,
      dependentLabel: 'Schwarzschild Radius',
      dependentUnit: schwarzschildRadiusUnit,
      dependentValueFromMass: schwarzschildRadiusFromMass,
    );
    final lifetimeChartData = ChartData<Time>.withDependentFunction(
      title: 'Mass vs Lifetime',
      startMass: startMass,
      endMass: endMass,
      dependentLabel: 'Lifetime',
      dependentUnit: lifetimeUnit,
      dependentValueFromMass: lifetimeFromMass,
    );
    return ChartViewModel(
      startMass: startMass,
      endMass: endMass,
      schwarzchildChartData: schwarzchildChartData,
      lifetimeChartData: lifetimeChartData,
    );
  }
}
