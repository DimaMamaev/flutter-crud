import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
