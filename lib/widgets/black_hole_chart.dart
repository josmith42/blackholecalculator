import 'package:blackholecalculator/providers/chart/chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';

class BlackHoleChart<T extends Dimension> extends StatelessWidget {
  const BlackHoleChart({super.key, required this.chartData});

  final ChartData<T> chartData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(chartData.title, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 1.5,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  color: Colors.blue,
                  dotData: FlDotData(show: false),
                  spots: chartData.data,
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
                    'Mass (${chartData.startMass.defaultUnit})',
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    maxIncluded: false,
                  ),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: Text(
                    '${chartData.dependentLabel} (${chartData.dependentUnit})',
                  ),
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
    );
  }
}
