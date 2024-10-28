import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final Color? color;
  final String iban;
  final double amount;
  final String type;

  const CardTile({
    super.key,
    required this.color,
    required this.iban,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        width: 337,
        alignment: Alignment.center,
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
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "$amount €",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //

            const Spacer(),
            //

            Text(
              type,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                height: 25,
                child: Text(
                  iban,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
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
