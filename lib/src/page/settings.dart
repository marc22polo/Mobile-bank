import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/settings_about.dart';
import 'package:flutter_application_1/src/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool darkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          AppLocalizations.of(context)!.settingsTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 16),
              child: Text(
                "Personalization",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SettingsGroup(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: [
                SettingsItem(
                  icons: Icons.dark_mode_outlined,
                  title: "Dark mode",
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  trailing: Switch.adaptive(
                    value: darkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                      setState(() {
                        darkMode =
                            Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode;
                      });
                    },
                  ),
                ),
                SettingsItem(
                  icons: Icons.language_outlined,
                  title: "Language (WIP)",
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  subtitle: "English",
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 16),
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SettingsGroup(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: [
                SettingsItem(
                  icons: Icons.info_outline,
                  title: "About",
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  onTap: () => SettingsAbout.showTransactionDetail(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
