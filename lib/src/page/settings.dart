import 'package:flutter/material.dart';
import 'package:mobile_bank/src/components/settings_about.dart';
import 'package:mobile_bank/src/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:mobile_bank/src/components/Settings_group.dart';
import 'package:mobile_bank/src/components/settings_item.dart';

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
          Padding(
            padding: const EdgeInsets.all(10),
            child: SettingsGroup(
              settingsGroupTitle: "Personalization",
              settingsGroupTitleStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: SettingsGroup(
              settingsGroupTitle: "About",
              settingsGroupTitleStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
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
