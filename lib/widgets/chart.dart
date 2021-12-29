// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:harcamalarv2/modals/transaction.dart';
import 'package:harcamalarv2/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart({required this.recentTransactions});
  //Verilerin statik yerine getirme yolu ile kullanımını sağlar
  List<Map<String, dynamic>> get groupedTransactionValues {
    //Otomatik verilen içeriğe oranlı liste oluşturulmasını sağlar
    return List.generate(7, (index) {
      //Zamanın belirtilen süreye göre dağıtılmasını sağlar
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    //Liste tipinin değişimini sağlayan fonksiyon
    return groupedTransactionValues.fold(0.0, (sum, variable) {
      return sum + variable["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map((data) {
            //Expanded türevi olarak daha detaylı yerleştirme ve sınırlama sağlar otomatik yayılma yerine
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: data["day"],
                  spendingAmount: data["amount"] as double,
                  spendingPct: maxSpending == 0.0
                      ? 0.0
                      : (data["amount"] as double) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
