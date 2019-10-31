import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/gridList.dart';
import 'package:learn_flutter/widget/tabBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home: new MyGridList(100,2),
    );
  }
}