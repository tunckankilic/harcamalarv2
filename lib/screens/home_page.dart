// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:harcamalarv2/widgets/new_transaction.dart';
import 'package:harcamalarv2/widgets/transaction_list.dart';

import '../modals/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      amount: 99.99,
      date: DateTime.now(),
      id: '1',
      title: 'Fender Guitar',
    ),
    Transaction(
      amount: 66.99,
      date: DateTime.now(),
      id: '2',
      title: 'Yamaha Guitar',
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        amount: amount,
        date: DateTime.now(),
        id: '${amount.toInt()}',
        title: title);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  //showModalBottomSheet
  //Alt taraftan extra ekran açılmasını sağlar
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: NewTransaction(addTransaction: _addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
        title: Text('Kişisel Harcamalar'),
        // backgroundColor: Colors.indigo,
      ),
      body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text(
                'CHARTT',
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black)),
            ),
            TransActionList(
              entries: _userTransactions,
            )
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
