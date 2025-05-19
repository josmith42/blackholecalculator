
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Screen {
  charts,
  calculator,
}

class ScreenNotifier extends StateNotifier<Screen> {
  ScreenNotifier() : super(Screen.charts);

  void setScreen(Screen screen) {
    state = screen;
  }
}

final screenProvider = StateNotifierProvider<ScreenNotifier, Screen>((ref) {
  return ScreenNotifier();
});