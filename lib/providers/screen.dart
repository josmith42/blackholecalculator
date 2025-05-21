import 'package:flutter/material.dart';

enum Screen {
  calculator(title: 'Calculator', icon: Icons.calculate),
  charts(title: 'Charts', icon: Icons.bar_chart);

  final String title;
  final IconData icon;

  const Screen({required this.title, required this.icon});
}
