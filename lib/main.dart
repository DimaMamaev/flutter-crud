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
          children: [
            Container(
              child: Text('Chart'),
            ),
            Column(
              children: transactions.map((ts) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      child: Text(ts.amount.toString()),
                    ),
                    Column(
                      children: [Text(ts.title), Text(ts.dateTime.toString())],
                    ),
                  ],
                ));
              }).toList(),
            ),
          ],
        ));
  }
}
