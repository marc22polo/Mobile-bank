import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final dynamic element;

  const TransactionTile({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    final myLocale = Localizations.localeOf(context).toString();
    final longNumberFormat =
        NumberFormat.currency(locale: myLocale, symbol: '€ ', decimalDigits: 2);

    return ListTile(
      tileColor: Theme.of(context).colorScheme.tertiary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Text(
        element['title'],
        maxLines: 1,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        element['description'],
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF808080),
          fontStyle: FontStyle.italic,
        ),
      ),
      trailing: Text(
        longNumberFormat.format(element['amount']),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: element['amount'] > 0
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
