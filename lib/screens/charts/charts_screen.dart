import 'package:blackholecalculator/providers/app/app_bar_provider.dart';
import 'package:blackholecalculator/providers/calculator/calculator_model.dart';
import 'package:blackholecalculator/providers/chart/chart_provider.dart';
import 'package:blackholecalculator/providers/chart/edit_chart_settings_data.dart';
import 'package:blackholecalculator/screens/charts/edit_chart_settings_dialog.dart';
import 'package:blackholecalculator/widgets/black_hole_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartsScreen extends ConsumerStatefulWidget {
  const ChartsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ChartsScreenState();
  }
}

class _ChartsScreenState extends ConsumerState<ChartsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(appBarProvider.notifier).setActions([
      IconButton(
        onPressed: () {
          final chartModel = ref.read(chartProvider);
          showDialog(
            context: context,
            builder:
                (context) => EditChartSettingsDialog(
                  editChartSettingsData: EditChartSettingsData(
                    startValue: chartModel.startMass.defaultValue.toString(),
                    endValue: chartModel.endMass.defaultValueText,
                    massUnit: chartModel.startMass.defaultUnit,
                    schwarzschildRadiusUnit:
                        chartModel.schwarzchildChartData.dependentUnit,
                    lifetimeUnit: chartModel.lifetimeChartData.dependentUnit,
                  ),
                  onSettingsSelected:
                      (newSettings) => ref
                          .read(chartProvider.notifier)
                          .setChartData(newSettings),
                ),
          );
        },
        icon: const Icon(Icons.settings),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final chartModel = ref.watch(chartProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlackHoleChart(chartData: chartModel.schwarzchildChartData),
            BlackHoleChart(chartData: chartModel.lifetimeChartData),
          ],
        ),
      ),
    );
  }
}
