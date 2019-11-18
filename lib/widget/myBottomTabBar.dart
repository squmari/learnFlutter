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

class HomeBottomTabBar extends MyBottomTabBar {
  HomeBottomTabBar(Function _tapMethod):super(_tapMethod);
  @override
  BottomNavigationBar createBottomTabBar(){
    return BottomNavigationBar(
      currentIndex: _bottomTabIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('ホーム'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('お知らせ'),
          icon: Icon(Icons.notifications),
        ),
        BottomNavigationBarItem(
          title: Text('マイページ'),
          icon: Icon(Icons.account_circle),
        ),
      ],
      onTap: _tapMethod,
    );
  }

}
