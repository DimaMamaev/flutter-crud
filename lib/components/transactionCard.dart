import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  TransactionCard(this.title, this.amount, this.date);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2)),
            child: Text(
              '\$${this.amount.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black)),
            Text(DateFormat.yMMMMd().format(this.date),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey)),
          ],
        ),
      ],
    ));
  }
}
