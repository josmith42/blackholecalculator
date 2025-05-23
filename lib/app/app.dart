import 'package:blackholecalculator/app/app_drawer.dart';
import 'package:blackholecalculator/app/bh_app_bar.dart';
import 'package:blackholecalculator/app/theme.dart';
import 'package:blackholecalculator/providers/app/screen.dart';
import 'package:blackholecalculator/providers/app/screen_provider.dart';
import 'package:blackholecalculator/screens/calculator/calculator_screen.dart';
import 'package:blackholecalculator/screens/charts/charts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = ref.watch(screenProvider);
    return MaterialApp(
      title: 'Black Hole Calculator',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      home: Scaffold(
        appBar: BHAppBar(title: Text(screen.title)),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: switch (screen) {
            Screen.charts => ChartsScreen(),
            Screen.calculator => CalculatorScreen(),
          },
        ),
      ),
    );
  }
}
