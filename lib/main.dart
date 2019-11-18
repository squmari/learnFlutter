import 'package:flutter/material.dart';
import 'package:learn_flutter/page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(20, 3)
    );
  }
}