import 'package:flutter/material.dart';

import '../main.dart';

AppBar buildAppBar({required int score}) {
  final double height = 52;
  return AppBar(
    title: Text(MyApp.title),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        alignment: Alignment.center,
        height: height,
        child: buildScore(score),
      ),
    ),
  );
}

Widget buildScore(int score) {
  final style =
      TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Score", style: style),
      Container(
        width: 60,
        child: Text(
          "$score",
          style: style,
          textAlign: TextAlign.right,
        ),
      ),
    ],
  );
}
