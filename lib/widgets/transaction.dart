import 'package:flutter/material.dart';

import 'package:crud/components/transactionCard.dart';
import 'package:crud/components/transactionsInput.dart';
import '../model/transaction.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'New car',
      amount: 1000,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'New phone',
      amount: 500,
      dateTime: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionInput(),
        TransactionCard(transactions),
      ],
    );
  }
}
