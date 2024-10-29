import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../components/card_tile.dart';
import '../demo/demo_data.dart';
import 'package:grouped_list/grouped_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _accounts = DemoData.getAccountList();
  final List _recentTrans = DemoData.getRecentTransactionList();

  @override
  Widget build(BuildContext context) {
    final myLocale = Localizations.localeOf(context).toString();
    final longNumberFormat =
        NumberFormat.currency(locale: myLocale, symbol: '€ ', decimalDigits: 2);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.homePageTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.notifications,
            ),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const PrimaryDrawer(),
      body: ListView(
        children: [
          // accounts
          SizedBox(
            height: 212,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
              itemCount: _accounts.length,
              itemBuilder: (context, int index) {
                return CardTile(
                  iban: _accounts[index]['iban'],
                  amount: _accounts[index]['amount'],
                  type: _accounts[index]['type'],
                );
              },
            ),
          ),

          // recent transactions
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              AppLocalizations.of(context)!.recentTransactionTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: GroupedListView(
              elements: _recentTrans,
              groupBy: (element) => element['date'],
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              groupSeparatorBuilder: (String groupByValue) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: 5,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    groupByValue,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                );
              },
              itemBuilder: (context, element) {
                return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: SizedBox(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(element['title']),
                      subtitle: Text(
                        element['description'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      trailing: Text(
                        longNumberFormat.format(element['amount']),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: element['amount'] > 0
                              ? Theme.of(context).colorScheme.primary
                              : const Color(0xFFC21807),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
