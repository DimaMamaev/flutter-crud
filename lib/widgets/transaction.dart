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
      title: 'Bought a new car',
      amount: 1000,
      dateTime: DateTime.now(),
    ),
  ];

  void _addTransactionHandler(
      String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: transactionTitle,
        amount: transactionAmount,
        dateTime: DateTime.now());
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionInput(_addTransactionHandler),
        TransactionCard(transactions),
      ],
    );
  }
}
