import 'package:flutter/material.dart';
import 'package:mobile_bank/src/page/settings.dart';
import 'drawer_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrimaryDrawer extends StatelessWidget {
  const PrimaryDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Icon(
              Icons.fingerprint, // TODO: add logo
              size: 50,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home
          PrimaryDrawerTile(
            text: AppLocalizations.of(context)!.drawerTileHome,
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // settings
          PrimaryDrawerTile(
            text: AppLocalizations.of(context)!.drawerTileSettings,
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          // logout
          PrimaryDrawerTile(
            text: AppLocalizations.of(context)!.drawerTileLogout,
            icon: Icons.logout,
            onTap: () => Navigator.pop(context),
          ),

          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
