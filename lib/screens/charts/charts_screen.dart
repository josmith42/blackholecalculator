import 'package:blackholecalculator/calc/unit_lists.dart';
import 'package:blackholecalculator/providers/chart/chart_provider.dart';
import 'package:blackholecalculator/providers/chart/edit_chart_settings_data.dart';
import 'package:blackholecalculator/screens/charts/edit_chart_settings_dialog.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fling_units/fling_units.dart';
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
  Widget build(BuildContext context) {
    final chartModel = ref.watch(chartProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mass vs Schwarzschild Radius',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton(
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder:
                          (context) => EditChartSettingsDialog<Mass>(
                            startValue: chartModel.startMass,
                            endValue: chartModel.endMass,
                            unitsList: massUnitsList,
                          ),
                    );
                    if (result == null || result is! EditChartSettingsData<Mass>) return;
                    final newChartData = result;
                    ref.read(chartProvider.notifier).setChartData(newChartData);
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
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
                      axisNameWidget: const Text('Mass (Solar Masses)'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        maxIncluded: false,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      axisNameWidget: const Text('Schwarzschild Radius (km)'),
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
