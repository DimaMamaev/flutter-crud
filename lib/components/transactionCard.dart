import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionCard extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionCard(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: this
            .transactions
            .map(
              (tx) => Card(
                  child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2)),
                      child: Text(
                        '\$${tx.amount.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black)),
                      Text(DateFormat.yMMMMd().format(tx.dateTime),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey)),
                    ],
                  ),
                ],
              )),
            )
            .toList());
  }
}
