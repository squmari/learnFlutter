import 'package:flutter/material.dart';

Container mysquare (double width, double height, [Color color = Colors.white]){
  return Container(
    width: width,
    height: height,
    color: color,
  );
}

Container myTextSquare (double width, double height, Widget w, [Color color = Colors.white]){
  return Container(
    width: width,
    height: height,
    color: color,
    child: w,
  );
}

