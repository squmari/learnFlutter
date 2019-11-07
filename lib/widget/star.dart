import 'package:flutter/material.dart';

Row star([double size = 18]){
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, color:Colors.red, size:size,),
      Icon(Icons.star, color:Colors.red, size:size,),
      Icon(Icons.star, color:Colors.red, size:size,),
      Icon(Icons.star_border, color:Colors.red, size:size,),
      Icon(Icons.star_border, color:Colors.red, size:size,),
    ],
  );
}