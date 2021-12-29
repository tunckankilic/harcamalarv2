// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:harcamalarv2/modals/transaction.dart';
import 'package:intl/intl.dart';

class TransActionList extends StatelessWidget {
  final List<Transaction> entries;

  TransActionList({
    required this.entries,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 2,
      //Spread methodunun gelişmiş alternatifi olarak kullanılır
      //Scroll destekli liste oluşturucu
      child: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(
              entries[index].title,
              style: TextStyle(
                color: Colors.indigo[900],
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  width: 5.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                //double değerlerin stringe dönüşütürülüp kısıtlanmasını sağlan fonksiyon
                '\$${entries[index].amount.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            subtitle: Text(
              //intl paketi ile datetime yerine dateformat kullanılır
              //date format daha detaylı ve daha tutarlıdır
              DateFormat.yMMMd().format(entries[index].date),
              style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300),
            ),
            trailing: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_forever),
                        ),
                      ),
                      Expanded(child: Text('#${entries[index].id}')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
