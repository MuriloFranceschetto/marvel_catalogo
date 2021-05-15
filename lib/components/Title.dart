import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String str;

  const MyTitle(this.str);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.str,
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
