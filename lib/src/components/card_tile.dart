import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTile extends StatelessWidget {
  final String iban;
  final double amount;
  final String type;

  const CardTile({
    super.key,
    required this.iban,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final myLocale = Localizations.localeOf(context).toString();
    final longNumberFormat =
        NumberFormat.currency(locale: myLocale, symbol: '€ ', decimalDigits: 2);

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
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
                    type,
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
                    iban,
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
                    "Balance",
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
                    longNumberFormat.format(amount),
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
    );
  }
}
