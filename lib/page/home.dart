import 'package:flutter/material.dart';
import 'package:learn_flutter/page/myPage.dart';
import 'package:learn_flutter/page/notifications.dart';
import 'package:learn_flutter/widget/myAppBar.dart';
import 'package:learn_flutter/widget/myBottomTabBar.dart';
import 'package:learn_flutter/widget/myTabBar.dart';

class Home extends StatefulWidget {

  final int row, col;
  final String title;
  Home(this.row,this.col,[this.title = 'Top Page']):super();
  
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  HomeTabBar _homeTabBar;
  TabController _tabController;

  final List<Tab> _topTab = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  @override
  void initState() {
    super.initState();
    this._homeTabBar = HomeTabBar(this, _topTab.length, _topTab);
    this._tabController = this._homeTabBar.controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HomeAppBar(widget.title, this._tabController, this._topTab).appBar,
        body: this._homeTabBar.view,
        bottomNavigationBar: HomeBottomTabBar(this.tapBottomIcon).bottomBar,
      ),
    );

  }

  void tapBottomIcon(int value){
    setState(() {
      print(value);
      if (value == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home(widget.row,widget.col)),
        );
        
      } else if(value == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Notifications(widget.row,widget.col)),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPage(widget.row,widget.col)),
        );
      }
    });
  }

}

