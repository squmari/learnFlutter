import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/myGridList.dart';

abstract class MyTabBar {

  TickerProvider _vsync;
  int _length;
  List<Tab> _tabs;
  TabController controller;
  TabBarView view;

  MyTabBar(this._vsync, this._length, this._tabs){
    this.controller = this.createTab();
    this.view = this.createView();
  }

  TabController createTab(){
    return TabController(vsync: this._vsync, length: this._length,);
  }

  TabBarView createView(){
    return TabBarView(
      controller: this.controller,
      children: this._tabs.map((Tab tab) {
        return this.setTabView(tab);
      }).toList(),
    );
  }

  Widget setTabView(Tab tab);
}

class HomeTabBar extends MyTabBar {
  HomeTabBar(TickerProvider _vsync, int _length, List<Tab> _tabs):super(_vsync, _length, _tabs);

  @override
  Widget setTabView(Tab tab) {
    return HomeGridList(30, 3).grid;
  }

}

class NotificationsTabBar extends MyTabBar {

  NotificationsTabBar(TickerProvider _vsync, int _length, List<Tab> _tabs):super(_vsync, _length, _tabs);

  @override
  Widget setTabView(Tab tab) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: this.contents(),
      ),
    );
  }

  List<Widget> contents(){
    List<Widget> contents = [];
    Widget content = Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.fiber_new, size: 40.0,color: Colors.red,),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    Text('3日前'),
                  ],
                ),
                Text('販売手数料も梱包資材も実質無料！超！出品祭開催中♪大好評につき第二弾！'),
              ],
            ),
          ),
        ],
      )
    );
    for (var i = 0; i < 10; i++) {
      contents.add(content);
    }
    return contents;
  }

}
