import 'package:flutter/material.dart';

enum Screen {
  charts(title: 'Charts', icon: Icons.bar_chart),
  calculator(title: 'Calculator', icon: Icons.calculate);

  final String title;
  final IconData icon;

  const Screen({required this.title, required this.icon});
}
