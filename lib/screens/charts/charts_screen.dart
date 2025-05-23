import 'package:blackholecalculator/providers/app/app_bar_provider.dart';
import 'package:blackholecalculator/providers/calculator/calculator_model.dart';
import 'package:blackholecalculator/providers/chart/chart_provider.dart';
import 'package:blackholecalculator/providers/chart/edit_chart_settings_data.dart';
import 'package:blackholecalculator/screens/charts/edit_chart_settings_dialog.dart';
import 'package:fl_chart/fl_chart.dart';
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
                    schwarzschildRadiusUnit: chartModel.schwarzschildRadiusUnit,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Mass vs Schwarzschild Radius',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8),
            AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      color: Colors.blue,
                      dotData: FlDotData(show: false),
                      spots: chartModel.chartData,
                      isCurved: true,
                    ),
                  ],
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text(
                        'Mass (${chartModel.startMass.defaultUnit})',
                      ),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        maxIncluded: false,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      axisNameWidget: Text('Schwarzschild Radius (${chartModel.schwarzschildRadiusUnit})'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        maxIncluded: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
