// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:harcamalarv2/modals/transaction.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kişisel Harcamalar'),
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            FirstCard(
              firstText: 'Chart',
              color: Colors.red,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: ListView(
                //Listeyi mapleyip widget haline getirme yolu
                children: transactions.map((tx) {
                  return ListTile(
                    title: Text(
                      tx.title,
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          width: 5.0,
                          color: Colors.red,
                        ),
                      ),
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.red[500],
                          fontWeight: FontWeight.w300),
                    ),
                    trailing: Text('#${tx.id}'),
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}

class FirstCard extends StatelessWidget {
  final String firstText;
  final Color color;
  FirstCard({required this.color, required this.firstText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: color,
        child: Text(
          firstText,
          textAlign: TextAlign.center,
        ),
        elevation: 11,
      ),
    );
  }
}
