import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final Color? color;
  final String iban;

  const CardTile({
    super.key,
    required this.color,
    required this.iban,
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
            const Spacer(),

            //
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 25,
                child: Text(
                  iban,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
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
