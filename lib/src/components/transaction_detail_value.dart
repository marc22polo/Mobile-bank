import 'package:flutter/material.dart';

class TransactionDetailValue extends StatelessWidget {
  final String value;

  const TransactionDetailValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
