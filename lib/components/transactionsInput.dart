import 'package:flutter/material.dart';

class TransactionInput extends StatefulWidget {
  final Function addHandler;

  TransactionInput(this.addHandler);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _onSubmitHandler() {
    final String titleValue = titleController.text;
    final double amountValue = double.parse(amountController.text);

    if (titleValue.isEmpty || amountValue <= 0) {
      return;
    }

    widget.addHandler(titleValue, amountValue);

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => _onSubmitHandler(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onSubmitHandler(),
            ),
            FlatButton(
              textColor: Colors.green,
              onPressed: _onSubmitHandler,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
