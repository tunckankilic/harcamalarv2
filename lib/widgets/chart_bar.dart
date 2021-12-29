// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPct;
  ChartBar({
    required this.label,
    required this.spendingAmount,
    required this.spendingPct,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          spendingAmount.toStringAsFixed(0),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          //Sırası ile üstten alta elemanların üst üste eklenip düzenlenmesini sağlayan widget
          child: Stack(
            children: [
              //içindeki widget'ı içinde bulunduğu alana sığdırma özelliği vardır
              Container(
                height: 20,
                child: FittedBox(
                  child: Text('\$ ${spendingAmount.toStringAsFixed(0)}'),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              //Başka bir değerin yansımasına göre sizedbox oluşturur
              FractionallySizedBox(
                heightFactor: spendingPct,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
