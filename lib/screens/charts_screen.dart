import 'package:blackholecalculator/calc/formulas.dart';
import 'package:blackholecalculator/calc/solar_mass.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) => Padding(
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
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
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
                      spots: List.generate(100, (i) {
                        return FlSpot(
                          i.toDouble(),
                          schwarzschildRadiusFromMass(
                            i.solarMasses,
                          ).butAs(kilo.meters).defaultValue,
                        );
                      }),
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
