import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/myCard.dart';
import 'package:learn_flutter/widget/star.dart';

GridView myGridList (int row, int col,[double rowSpace = 0, double colSpace = 0]){
  return GridView.count(
    crossAxisCount: col,
    mainAxisSpacing: rowSpace,
    crossAxisSpacing: colSpace,
    children: List.generate(row, (index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          myCard(),
        ],
      );
    }),
  );
}