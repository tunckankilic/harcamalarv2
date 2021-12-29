// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:harcamalarv2/widgets/chart.dart';
import 'package:harcamalarv2/widgets/new_transaction.dart';
import 'package:harcamalarv2/widgets/transaction_list.dart';

import '../modals/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   amount: 99.99,
    //   date: DateTime.now(),
    //   id: '1',
    //   title: 'Fender Guitar',
    // ),
    // Transaction(
    //   amount: 66.99,
    //   date: DateTime.now(),
    //   id: '2',
    //   title: 'Yamaha Guitar',
    // ),
  ];

  //listeden filtre uygulanarak veri çekimini sağlar
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  //Listeye veri girdisi sağlar
  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
        amount: amount, date: date, id: '${amount.toInt()}', title: title);
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

  //Girdinin Silinmesini sağlar
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
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
              child: Chart(
                recentTransactions: _recentTransactions,
              ),
            ),
            TransActionList(
              entries: _userTransactions,
              deleteTX: _deleteTransaction,
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
