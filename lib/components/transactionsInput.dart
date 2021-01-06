import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final Function addHandler;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionInput(this.addHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              keyboardType: TextInputType.text,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              textColor: Colors.green,
              onPressed: () => addHandler(
                  titleController.text, double.parse(amountController.text)),
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
