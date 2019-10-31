import 'package:flutter/material.dart';


/// GridListの生成
class MyGridList extends StatefulWidget {

  final int row, col;
  final String title;
  MyGridList(this.row,this.col,[this.title = 'GridList']):super();
  
  @override
  _MyGridListState createState() => new _MyGridListState();
}

class _MyGridListState extends State<MyGridList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
          crossAxisCount: widget.col,
          children: List.generate(widget.row, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),

      ),
    );
  }
}