import 'package:flutter/material.dart';

abstract class MyAppBar {
  AppBar appBar;
  MyAppBar(){
    this.appBar = this.createAppBar();
  }

  AppBar createAppBar();
}

class HomeAppBar extends MyAppBar {
  String title = '';
  TabController _controller;
  List<Tab> _tabs = [];
  HomeAppBar(this.title, this._controller, this._tabs):super();
  
  @override
  AppBar createAppBar(){
    return AppBar(
      title: Text(this.title),
      bottom: TabBar(
        controller: this._controller,
        tabs: this._tabs,
      ),
    );
  }
}