import 'package:blackholecalculator/providers/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  void _navigateToScreen(WidgetRef ref, Screen screen) {
    ref.read(screenProvider.notifier).setScreen(screen);
    Navigator.pop(ref.context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).splashColor),
            child: Text(
              'Black Hole Calculator',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculator'),
            onTap: () => _navigateToScreen(ref, Screen.calculator),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Charts'),
            onTap: () => _navigateToScreen(ref, Screen.charts),
          ),
        ],
      ),
    );
  }
}
