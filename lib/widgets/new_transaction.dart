// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction({required this.addTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController taskControl = TextEditingController();

  TextEditingController amountControl = TextEditingController();

  void submitData() {
    final titleEntried = taskControl.text;
    final amountEntried = double.parse(amountControl.text);
    if (titleEntried.isEmpty || amountEntried <= 0) {
      return;
    }
    widget.addTransaction(
      titleEntried,
      amountEntried,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      elevation: 11,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Task',
                fillColor: Colors.white,
                filled: true,
              ),
              controller: taskControl,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                fillColor: Colors.white,
                filled: true,
              ),
              controller: amountControl,
            ),
            ElevatedButton(
              onPressed: () {
                submitData();
              },
              child: Text('Girdi Ekle'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red[900], onPrimary: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
