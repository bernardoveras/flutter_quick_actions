import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

import '../settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const quickActions = QuickActions();

      quickActions.initialize((type) {
        if (type == 'view_settings') {
          Navigator.of(context).pushNamed('/settings');
        }
      });

      quickActions.setShortcutItems([
        const ShortcutItem(
          type: 'view_settings',
          localizedTitle: 'View settings',
          icon: 'settings_icon',
        ),
      ]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
