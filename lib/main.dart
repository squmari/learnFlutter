import 'package:flutter/material.dart';
import 'package:learn_flutter/page/topPage.dart';
import 'package:learn_flutter/template/mainTemplate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home: TopPage(20, 3)
    );
  }
}