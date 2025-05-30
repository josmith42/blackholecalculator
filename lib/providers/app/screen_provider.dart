
import 'package:blackholecalculator/providers/app/screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenNotifier extends StateNotifier<Screen> {
  ScreenNotifier() : super(Screen.calculator);

  void setScreen(Screen screen) => state = screen;
}

final screenProvider = StateNotifierProvider<ScreenNotifier, Screen>((ref) {
  return ScreenNotifier();
});