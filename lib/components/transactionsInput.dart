import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  final Function addHandler;

  TransactionInput(this.addHandler);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime choosenDate;

  void _onSubmitHandler() {
    final String titleValue = titleController.text;
    final double amountValue = double.parse(amountController.text);

    if (titleValue.isEmpty || amountValue <= 0) {
      return;
    }

    widget.addHandler(titleValue, amountValue);

    Navigator.of(context).pop();
  }

  void _onDatePickerHandler() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        choosenDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.text,
              controller: titleController,
              onSubmitted: (_) => _onSubmitHandler(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(fontSize: 20),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => _onSubmitHandler(),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      choosenDate == null
                          ? 'No data peeked'
                          : 'Choosen date: ${DateFormat().add_yMd().format(choosenDate)}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  FlatButton(
                      onPressed: _onDatePickerHandler,
                      color: Colors.black,
                      child: Text(
                        choosenDate == null ? 'Choose a day' : 'Change a day',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: _onSubmitHandler,
                child: Text(
                  'Add transaction',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
