import 'package:flutter/material.dart';

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

class TopPageTabBar extends MyTabBar {
  TopPageTabBar(TickerProvider _vsync, int _length, List<Tab> _tabs):super(_vsync, _length, _tabs);

  @override
  Widget setTabView(Tab tab) {
    return Center(
      child: Text("test"),
    );
  }

}
