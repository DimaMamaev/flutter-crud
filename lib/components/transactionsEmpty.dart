import 'package:flutter/material.dart';

class TransactionsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'List is empty! Add new one!',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          height: 350,
          child: Image.asset(
            'assets/images/empty_list.gif',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
