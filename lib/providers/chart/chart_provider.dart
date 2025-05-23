import 'package:blackholecalculator/calc/solar_mass.dart';
import 'package:blackholecalculator/providers/chart/chart_view_model.dart';
import 'package:blackholecalculator/providers/chart/edit_chart_settings_data.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartNotifier extends StateNotifier<ChartViewModel> {
  ChartNotifier()
    : super(ChartViewModel(startMass: 1.solarMasses, endMass: 100.solarMasses, schwarzschildRadiusUnit: kilo.meters));

  void setChartData(EditChartSettingsData data) {
    final startMass = double.tryParse(data.startValue);
    final endMass = double.tryParse(data.endValue);

    if (startMass == null || endMass == null) return; // todo handle error

    state = ChartViewModel(
      startMass: Measurement(magnitude: startMass, defaultUnit: data.massUnit),
      endMass: Measurement(magnitude: endMass, defaultUnit: data.massUnit),
      schwarzschildRadiusUnit: data.schwarzschildRadiusUnit,
    );
  }
}

final chartProvider = StateNotifierProvider<ChartNotifier, ChartViewModel>((
  ref,
) {
  return ChartNotifier();
});
