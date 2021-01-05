import 'package:crud/components/transactionCard.dart';
import 'package:flutter/material.dart';

import 'package:crud/model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text('Chart'),
            ),
            Card(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    FlatButton(
                      textColor: Colors.green,
                      onPressed: null,
                      child: Text('Add transaction'),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((ts) {
                return TransactionCard(ts.title, ts.amount, ts.dateTime);
              }).toList(),
            ),
          ],
        ));
  }
}

// 75
