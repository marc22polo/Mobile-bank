import 'package:flutter/material.dart';

class PrimaryDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const PrimaryDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      onTap: onTap,
    );
  }
}
