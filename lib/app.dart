
import 'package:blackholecalculator/screens/charts_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 106, 37)),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 2, 54, 19),
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(actions: [],title: Text('Black Hole app'),),
        body: ChartsScreen()
      )
    );
  }
}