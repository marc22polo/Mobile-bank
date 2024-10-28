import 'package:flutter/material.dart';
import 'drawer_tile.dart';

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
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // settings

          // logout
        ],
      ),
    );
  }
}
