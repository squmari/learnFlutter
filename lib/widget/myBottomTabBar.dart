import 'package:flutter/material.dart';

abstract class MyBottomTabBar {
  BottomNavigationBar bottomBar;
  int _bottomTabIndex = 0;
  Function _tapMethod;

  MyBottomTabBar(this._tapMethod){
    this.bottomBar = createBottomTabBar();
  }

  BottomNavigationBar createBottomTabBar();

}

class TopPageBottomTabBar extends MyBottomTabBar {
  TopPageBottomTabBar(Function _tapMethod):super(_tapMethod);
  @override
  BottomNavigationBar createBottomTabBar(){
    return BottomNavigationBar(
      currentIndex: _bottomTabIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('bottom'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('bottom'),
          icon: Icon(Icons.android),
        ),
        BottomNavigationBarItem(
          title: Text('bottom'),
          icon: Icon(Icons.favorite),
        ),
      ],
      onTap: _tapMethod,
    );
  }

}
