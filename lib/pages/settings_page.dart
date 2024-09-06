import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personalworkout/components/my_settings_tile.dart';
import 'package:personalworkout/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          MySettingsTile(
            title: "Dark Mode",
            action: CupertinoSwitch(
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheam(),
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
            ),
          )
        ],
      ),
    );
  }
}
