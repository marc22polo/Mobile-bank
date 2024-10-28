import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/card_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: SizedBox(
        height: 212,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
          children: const [
            CardTile(
              color: Color(0xFF111111),
              iban: "SI56  1920  0123  4567  892",
              amount: 704.3,
              type: "TRR",
            ),
            CardTile(
              color: Color(0xFF222222),
              iban: "SI56  1920  0123  4567  892",
              amount: 212.78,
              type: "Prepaid",
            ),
            CardTile(
              color: Color(0xFF333333),
              iban: "SI56  1920  0123  4567  892",
              amount: 25600.19,
              type: "Golden booklet",
            ),
          ],
        ),
      ),
    );
  }
}
