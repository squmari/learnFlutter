import 'package:flutter/material.dart';
import 'package:learn_flutter/page/BuildingLayoutsTutorial.dart';
import 'package:learn_flutter/page/androidDevs.dart';
import 'package:learn_flutter/widget/myAppBar.dart';
import 'package:learn_flutter/widget/myBottomTabBar.dart';
import 'package:learn_flutter/widget/myTabBar.dart';

class TopPage extends StatefulWidget {

  final int row, col;
  final String title;
  TopPage(this.row,this.col,[this.title = 'Top Page']):super();
  
  @override
  _TopPageState createState() => new _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin{

  TopPageTabBar _topPageTabBar;
  TabController _tabController;

  final List<Tab> _topTab = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  @override
  void initState() {
    super.initState();
    this._topPageTabBar = TopPageTabBar(this, _topTab.length, _topTab);
    this._tabController = this._topPageTabBar.controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: TopPageAppBar(widget.title, this._tabController, this._topTab).appBar,
        body: this._topPageTabBar.view,
        bottomNavigationBar: TopPageBottomTabBar(this.tapBottomIcon).bottomBar,
      ),
    );

  }

  void tapBottomIcon(int value){
    setState(() {
      print(value);
      if (value == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TopPage(widget.row,widget.col)),
        );
        
      } else if(value == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuildingLayoutsTutorial()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AndroidDevs()),
        );
      }
    });
  }

}

