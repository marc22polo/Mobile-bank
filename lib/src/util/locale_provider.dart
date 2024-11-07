import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:language_picker/languages.dart';
import 'package:mobile_bank/src/util/hive_settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  static final List<Language> _supportedLocales = [
    Languages.english,
    Languages.slovenian,
  ];

  static List<Language> get supportedLocales => _supportedLocales;
  Locale? get locale => _locale;

  String getLocaleName(Locale locale) {
    return Language.fromIsoCode(locale.languageCode).nativeName;
  }

  void setLocale({required Locale locale}) {
    final settingsBox = Hive.box('settings_box');

    const supportedLocales = AppLocalizations.supportedLocales;

    if (supportedLocales.contains(locale)) {
      _locale = locale;
    } else if (supportedLocales.contains(Locale(locale.languageCode))) {
      _locale = Locale(locale.languageCode);
    } else {
      _locale = const Locale('en');
    }

    settingsBox.put(HiveSettings.settingsLocale.name, locale.toString());
    notifyListeners();
  }
}
