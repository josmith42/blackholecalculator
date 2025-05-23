
import 'package:blackholecalculator/providers/app/app_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BHAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const BHAppBar({super.key, this.title});

  final Widget? title;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarViewModel = ref.watch(appBarProvider);
    return AppBar(
      title: title,
      actions: appBarViewModel.actions
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}