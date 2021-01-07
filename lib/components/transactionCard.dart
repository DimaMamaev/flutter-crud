import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionCard extends StatelessWidget {
  final List<Transaction> transactions;
  final Function onDeleteHandler;

  TransactionCard(this.transactions, this.onDeleteHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                          child: Text(
                        '\$${transactions[index].amount}',
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(transactions[index].dateTime),
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.train),
                    color: Colors.red,
                    onPressed: () => onDeleteHandler(transactions[index].id),
                  ),
                ),
              );
            }));
  }
}
