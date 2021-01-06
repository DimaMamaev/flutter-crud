import 'package:crud/components/transactionCard.dart';
import 'package:crud/components/transactionsInput.dart';
import 'package:crud/model/transaction.dart';
import 'package:flutter/material.dart';

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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

  void _onAddBtnHandler(BuildContext bctx) {
    showModalBottomSheet(
        context: bctx,
        builder: (_) {
          return TransactionInput(_addTransactionHandler);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _onAddBtnHandler(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text('Chart'),
          ),
          Column(
            children: [
              TransactionCard(transactions),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _onAddBtnHandler(context),
      ),
    );
  }
}
