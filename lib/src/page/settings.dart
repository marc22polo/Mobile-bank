import 'package:flutter/material.dart';
import 'package:mobile_bank/src/components/selection_window.dart';
import 'package:mobile_bank/src/components/settings_about.dart';
import 'package:mobile_bank/src/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_bank/src/components/Settings_group.dart';
import 'package:mobile_bank/src/components/settings_item.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeMode? themeMode;

  @override
  Widget build(BuildContext context) {
    themeMode ??= ThemeMode.system;

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
              settingsGroupTitle:
                  AppLocalizations.of(context)!.settingsPersonalizationTitle,
              settingsGroupTitleStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: [
                SettingsItem(
                  icons: Icons.dark_mode_outlined,
                  title: AppLocalizations.of(context)!.settingsDarkMode,
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  onTap: () async {
                    int? val = await showDialog<int>(
                      context: context,
                      builder: (context) => SelectionWindow(
                        title: "Theme",
                        values: ThemeMode.values.map((ThemeMode themeModes) {
                          return themeModes.name;
                        }).toList(),
                      ),
                    );

                    if (val != null) {
                      themeMode = ThemeMode.values.elementAt(val);
                      // ignore: use_build_context_synchronously
                      Provider.of<ThemeProvider>(context,
                              listen: false) // TODO: remove the ignore
                          .setTheme(themeMode);
                      setState(() {
                        themeMode;
                      });
                    }
                  },
                ),
                SettingsItem(
                  icons: Icons.translate_outlined,
                  title:
                      "${AppLocalizations.of(context)!.settingsLanguage} (WIP)",
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
              settingsGroupTitle:
                  AppLocalizations.of(context)!.settingsAboutTitle,
              settingsGroupTitleStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: [
                SettingsItem(
                  icons: Icons.info_outline,
                  title: AppLocalizations.of(context)!.settingsAbout,
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
