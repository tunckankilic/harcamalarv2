import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              'assets/waiting.png',
              fit: BoxFit.cover,
            ),
            height: 300,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'No transaction added',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[900]),
          ),
        ],
      ),
    );
  }
}
