import 'package:flutter/material.dart';
import 'package:learn_flutter/page/Home.dart';
import 'package:learn_flutter/page/myPage.dart';
import 'package:learn_flutter/widget/myAppBar.dart';
import 'package:learn_flutter/widget/myBottomTabBar.dart';
import 'package:learn_flutter/widget/myTabBar.dart';

class Notifications extends StatefulWidget {

  final int row, col;
  final String title;
  Notifications(this.row,this.col,[this.title = 'Notifications']):super();
  
  @override
  _NotificationsState createState() => new _NotificationsState();
}

class _NotificationsState extends State<Notifications> with SingleTickerProviderStateMixin{

  NotificationsTabBar _notificationsTabBar;
  TabController _tabController;

  final List<Tab> _topTabs = [
    Tab(text: 'お知らせ'),
    Tab(text: 'ニュース'),
  ];

  @override
  void initState() {
    super.initState();
    this._notificationsTabBar = NotificationsTabBar(this, this._topTabs.length, _topTabs);
    this._tabController = this._notificationsTabBar.controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HomeAppBar(widget.title, this._tabController, this._topTabs).appBar,
        body: this._notificationsTabBar.view,
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

