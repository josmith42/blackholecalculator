
import 'package:blackholecalculator/providers/app/app_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarNotifier extends StateNotifier<AppBarViewModel> {
  AppBarNotifier(): super(AppBarViewModel());

  void setActions(List<Widget> actions) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = AppBarViewModel(actions: actions);
    });
  }
}

final appBarProvider = StateNotifierProvider<AppBarNotifier, AppBarViewModel>((ref) {
  return AppBarNotifier();
});