// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction({required this.addTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController _taskControl = TextEditingController();

  TextEditingController _amountControl = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitData() {
    if (_amountControl.text.isEmpty) {
      return;
    }
    final _titleEntried = _taskControl.text;
    final _amountEntried = double.parse(_amountControl.text);
    if (_titleEntried.isEmpty || _amountEntried <= 0) {
      return;
    }
    widget.addTransaction(
      _titleEntried,
      _amountEntried,
      _selectedDate
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.utc(1989),
            lastDate: DateTime.utc(2099))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _taskControl,
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
              controller: _amountControl,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  (_selectedDate == null)
                      ? 'Tarih Seç'
                      : 'Tarih: ${DateFormat.yMd().format(_selectedDate)}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: _presentDatePicker,
                      child: Text('Tarih Seç'),
                    ),
                    SizedBox(
                      width: 20,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
