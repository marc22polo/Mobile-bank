import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_bank/src/theme/theme_provider.dart';
import 'package:mobile_bank/src/util/hive_settings.dart';
import 'package:mobile_bank/src/util/locale_provider.dart';
import 'src/page/login.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize HIVE
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = await Hive.openBox('settings_box');

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData getTheme(BuildContext context) {
    late ThemeMode themeMode;
    final settingsBox = Hive.box('settings_box');

    // settingsBox.delete(HiveSettings.settingsTheme.name);
    // settingsBox.delete(HiveSettings.settingsLocale.name);

    themeMode = ThemeMode.values.elementAt(
        settingsBox.get(HiveSettings.settingsTheme.name, defaultValue: 0));

    return Provider.of<ThemeProvider>(context).getTheme(themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LoginPage(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('en'),
            Locale('sl'),
          ],
          locale: localeProvider.locale,
          theme: getTheme(context),
        ),
      ),
    );
  }
}
