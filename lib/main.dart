import 'package:crud/components/chartOfTransactions.dart';
import 'package:crud/components/transactionCard.dart';
import 'package:crud/components/transactionsEmpty.dart';
import 'package:crud/components/transactionsInput.dart';
import 'package:crud/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note your expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'XanhMono',
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Transaction> transactions = [];

  void _addTransactionHandler(
      String transactionTitle, double transactionAmount, DateTime date) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: transactionTitle,
        amount: transactionAmount,
        dateTime: date);
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

  void _onRemoveTransactionHandler(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _lastWeekTransactions {
    return transactions
        .where((element) => element.dateTime
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Note your expenses',
        style: TextStyle(fontSize: 30),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _onAddBtnHandler(context),
        )
      ],
    );
    final double screenHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          transactions.isEmpty
              ? TransactionsEmpty()
              : Column(children: [
                  Container(
                      height: screenHeight * 0.3,
                      child: Chart(_lastWeekTransactions)),
                  Container(
                      height: screenHeight * 0.7,
                      child: TransactionCard(
                          transactions, _onRemoveTransactionHandler)),
                ])
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
