import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool _darkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Text("Dark mode"),
            Checkbox(
              value: _darkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
                setState(() {
                  _darkMode = Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
