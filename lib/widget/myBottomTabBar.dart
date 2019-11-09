import 'package:flutter/material.dart';

TabBarView myBottomTabBar (){
  return TabBarView(
    children: <Widget>[
      Center(child: Icon(Icons.cloud, size:32, color:Colors.teal)),
      Center(child: Icon(Icons.cloud, size:32, color:Colors.teal)),
      Center(child: Icon(Icons.cloud, size:32, color:Colors.teal)),
    ],
  );
}