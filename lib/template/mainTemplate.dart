import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/myGridList.dart';


/// GridListの生成
class MainTemplate extends StatefulWidget {

  final int row, col;
  final String title;
  MainTemplate(this.row,this.col,[this.title = 'GridList']):super();
  
  @override
  _MainTemplateState createState() => new _MainTemplateState();
}

class _MainTemplateState extends State<MainTemplate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: myGridList(100, 3),

      ),
    );
  }
}

