import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/src/components/custom_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AccountCardTile extends StatefulWidget {
  final String iban;
  final double amount;
  final String type;

  const AccountCardTile({
    super.key,
    required this.iban,
    required this.amount,
    required this.type,
  });

  @override
  State<AccountCardTile> createState() => _AccountCardTileState();
}

class _AccountCardTileState extends State<AccountCardTile> {
  @override
  Widget build(BuildContext context) {
    final myLocale = Localizations.localeOf(context).toString();
    final longNumberFormat =
        NumberFormat.currency(locale: myLocale, symbol: '€ ', decimalDigits: 2);

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: CircularMenu(
        toggleButtonColor: Theme.of(context).colorScheme.primary,
        toggleButtonIconColor: Theme.of(context).colorScheme.onPrimary,
        alignment: Alignment.topRight,
        toggleButtonSize: 15,
        radius: 80,
        items: [
          CircularMenuItem(
              iconSize: 15,
              icon: Icons.more_horiz,
              iconColor: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                setState(() {});
              }),
          CircularMenuItem(
              iconSize: 15,
              icon: CustomIcons.exchange,
              iconColor: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                setState(() {});
              }),
          CircularMenuItem(
              iconSize: 15,
              icon: CustomIcons.doc_text,
              iconColor: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                setState(() {});
              }),
          CircularMenuItem(
              iconSize: 15,
              icon: Icons.camera_alt,
              iconColor: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                setState(() {});
              })
        ],
        backgroundWidget: Container(
          width: 337,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                offset: const Offset(0, 3), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),

              // type
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      widget.type,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              // iban
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 15,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      widget.iban,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              // spacer
              const Spacer(),

              // balance text
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.accountCardBalance,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),

              // balance amount
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      longNumberFormat.format(widget.amount),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //

              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
