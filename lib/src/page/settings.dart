import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:language_picker/languages.dart';
import 'package:mobile_bank/src/components/selection_window.dart';
import 'package:mobile_bank/src/components/settings_about.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_bank/src/components/Settings_group.dart';
import 'package:mobile_bank/src/components/settings_item.dart';
import 'package:mobile_bank/src/theme/theme_provider.dart';
import 'package:mobile_bank/src/util/hive_settings.dart';
import 'package:mobile_bank/src/util/locale_provider.dart';
import 'package:mobile_bank/src/util/selection_window_helper.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ThemeMode themeMode;
  late Language defaultLanguage;
  final _settingsBox = Hive.box('settings_box');

  @override
  void initState() {
    super.initState();

    themeMode = ThemeMode.values.elementAt(
        _settingsBox.get(HiveSettings.settingsTheme.name, defaultValue: 0));
    defaultLanguage = Language.fromIsoCode(
        _settingsBox.get(HiveSettings.settingsLocale.name, defaultValue: 'en'));
  }

  @override
  Widget build(BuildContext context) {
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
                  subtitle:
                      "${themeMode.name[0].toUpperCase()}${themeMode.name.substring(1).toLowerCase()}",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => SelectionWindow(
                        title: "Theme",
                        selectedValue: themeMode.index,
                        values: ThemeMode.values.map((ThemeMode themeModes) {
                          return "${themeModes.name[0].toUpperCase()}${themeModes.name.substring(1).toLowerCase()}";
                        }).toList(),
                        onPressOK: () {
                          int? currSelectedValue =
                              SelectionWindowHelper.selectedValue;
                          currSelectedValue ??= 0;

                          themeMode =
                              ThemeMode.values.elementAt(currSelectedValue);
                          Provider.of<ThemeProvider>(context, listen: false)
                              .setTheme(themeMode);
                          _settingsBox.put(HiveSettings.settingsTheme.name,
                              currSelectedValue);
                          setState(() {
                            themeMode;
                          });
                        },
                      ),
                    );
                  },
                ),
                SettingsItem(
                  icons: Icons.translate_outlined,
                  title: AppLocalizations.of(context)!.settingsLanguage,
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  subtitle: defaultLanguage.nativeName,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => SelectionWindow(
                        title: "Language",
                        selectedValue: themeMode.index,
                        values: LocaleProvider.supportedLocales
                            .map((Language languages) {
                          return languages.nativeName;
                        }).toList(),
                        onPressOK: () {
                          int? currSelectedValue =
                              SelectionWindowHelper.selectedValue;
                          currSelectedValue ??= 0;

                          defaultLanguage = LocaleProvider.supportedLocales
                              .elementAt(currSelectedValue);
                          Provider.of<LocaleProvider>(context, listen: false)
                              .setLocale(
                                  locale: Locale(defaultLanguage.isoCode));

                          _settingsBox.put(HiveSettings.settingsLocale.name,
                              defaultLanguage.isoCode);
                          setState(() {
                            defaultLanguage;
                          });
                        },
                      ),
                    );
                  },
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
