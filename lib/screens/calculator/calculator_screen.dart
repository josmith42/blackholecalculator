import 'package:blackholecalculator/screens/calculator/calculator_row.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        children: [
          CalculatorRow(title: "Mass"),
          CalculatorRow(title: "Schwarzschild radius"),
        ],
      ),
    );
  }
}
