import 'package:flutter/material.dart';
import 'package:mobile_bank/src/components/transaction_data_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class TransactionDetail {
  const TransactionDetail();

  static void showTransactionDetail(BuildContext context, dynamic element) {
    double mHeight = MediaQuery.of(context).size.height;
    final myLocale = Localizations.localeOf(context).toString();
    final longNumberFormat =
        NumberFormat.currency(locale: myLocale, symbol: '€ ', decimalDigits: 2);

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: mHeight,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // close button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // close button
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // transaction data
              // -- Payer
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.transactionPayerData,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // account
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionAccount}:",
                value: element['payerAccount'],
                padLeft: 10,
                padRight: 10,
                padTop: 10,
              ),
              // reference
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionReference}:",
                value: element['payerReference'],
                padLeft: 10,
                padRight: 10,
                padTop: 5,
              ),
              // name
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionName}:",
                value: element['payerName'],
                padLeft: 10,
                padRight: 10,
                padTop: 5,
              ),
              // address
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionAddress}:",
                value: element['payerAddress'],
                padLeft: 10,
                padRight: 10,
                padTop: 5,
              ),

              // -- Receiver
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.transactionReceiverData,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // account
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionAccount}:",
                value: element['receiverAccount'],
                padLeft: 10,
                padRight: 10,
                padTop: 10,
              ),
              // reference
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionReference}:",
                value: element['receiverReference'],
                padLeft: 10,
                padRight: 10,
                padTop: 5,
              ),
              // name
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionName}:",
                value: element['receiverName'],
                padLeft: 10,
                padRight: 10,
                padTop: 5,
              ),
              // address
              TransactionDataRow(
                title: "${AppLocalizations.of(context)!.transactionAddress}:",
                value: element['receiverAddress'],
                padLeft: 10,
                padRight: 10,
                padTop: 5,
              ),

              // -- Transaction details
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.transactionDetail,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // amount
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Row(
                  children: [
                    Text("${AppLocalizations.of(context)!.transactionAmount}:"),
                    const Spacer(),
                    Text(
                      longNumberFormat.format(
                        element['amount'],
                      ),
                    ),
                  ],
                ),
              ),
              // currency date
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                child: Row(
                  children: [
                    Text(
                        "${AppLocalizations.of(context)!.transactionCurrencyDate}:"),
                    const Spacer(),
                    Text(
                      DateFormat.yMd(
                        Localizations.localeOf(context).toString(),
                      ).format(
                        DateTime.parse(
                          element['currencyDate'],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // payment date
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                child: Row(
                  children: [
                    Text(
                        "${AppLocalizations.of(context)!.transactionPaymentDate}:"),
                    const Spacer(),
                    Text(
                      DateFormat.yMd(
                        Localizations.localeOf(context).toString(),
                      ).format(
                        DateTime.parse(
                          element['paymentExecutionDate'],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
