import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/drawer.dart';
import 'package:flutter_application_1/src/components/transaction_detail.dart';
import 'package:flutter_application_1/src/components/transaction_tile.dart';
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.homePageTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.onPrimary,
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

          // grouped list view
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: GroupedListView(
              elements: _recentTrans,
              groupBy: (element) =>
                  DateTime.parse(element['paymentExecutionDate']),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              order: GroupedListOrder.DESC,

              // group header
              groupSeparatorBuilder: (DateTime groupByValue) {
                return Center(
                  child: Container(
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
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.outline,
                          offset: const Offset(0, 5), //(x,y)
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Text(
                      DateFormat.yMMMMd(
                        Localizations.localeOf(context).toString(),
                      ).format(groupByValue),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
              },

              // group items
              itemBuilder: (context, element) {
                return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: GestureDetector(
                    child: TransactionTile(element: element),
                    onTap: () => TransactionDetail.showTransactionDetail(
                        context, element),
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
