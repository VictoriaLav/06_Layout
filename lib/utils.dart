import 'dart:math';
import 'package:flutter/material.dart';

Color color;

final getListWidget = (int count) => List<Widget>.generate(
    count,
        (i) {
      return Card(
        child: ListTile(
          title: Text('$i'),
        ),
      );
    }
);

final getListSeparated = (int count) => List<Widget>.generate(
    count,
        (i) {
      return Container(
        height: 10,
        color: Colors.blueGrey[100],
      );
    }
);

final getListGradient = (int count) => List<Widget>.generate(
    count,
        (i) {
      return
        Card(
          color: findColor(count, i),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
      );
    }
);

Color findColor(int count, int i) {
  if (i == 0) color = Colors.green[50];
  else if ((1000 ~/ count.toDouble()) * i == 500) color = Colors.green;
  else {
    var color2 = Colors.green[(1000 ~/ count.toDouble()) * i];
    color = (color2 == null ? color : color2);
  }
  return color;
}