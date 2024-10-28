import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/card_tile.dart';
import '../demo/demo_data.dart';

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
        title: Text(
          AppLocalizations.of(context)!.homePageTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const PrimaryDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Recent transactions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                itemCount: _recentTrans.length,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return Text(
                    _recentTrans[index]['description'],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
