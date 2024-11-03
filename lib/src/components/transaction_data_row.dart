import 'package:flutter/material.dart';
import 'package:mobile_bank/src/components/transaction_detail_value.dart';

class TransactionDataRow extends StatelessWidget {
  final String title;
  final String value;
  final double padLeft;
  final double padRight;
  final double padTop;

  const TransactionDataRow({
    super.key,
    required this.title,
    required this.value,
    required this.padLeft,
    required this.padRight,
    required this.padTop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padLeft, top: padTop, right: padRight),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          TransactionDetailValue(value: value),
        ],
      ),
    );
  }
}
