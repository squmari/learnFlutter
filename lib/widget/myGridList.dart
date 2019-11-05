import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/myContainer.dart';

GridView myGridList (int row, int col,[double rowSpace = 0, double colSpace = 0]){
  return GridView.count(
    crossAxisCount: col,
    mainAxisSpacing: rowSpace,
    crossAxisSpacing: colSpace,
    children: List.generate(row, (index) {
      return Center(
        child: myTextSquare(80, 80, Align(alignment: Alignment.center, child: Text('Hello')) , Colors.red),
      );
    }),
  );
}

