import 'package:flutter/material.dart';

class MyTabBar {
  TickerProvider _vsync;
  int _length;
  MyTabBar(this._vsync, this._length){
    print("test");
  }

  TabController ab (){
    return TabController(vsync: this._vsync, length: this._length,);
  }
  
}

class MyTabBarView extends TabBarView{
  
}




// class MyTabBar extends StatefulWidget {
//   @override
//   _MyTabBarState createState() => new _MyTabBarState();
// }

// class _MyTabBarState extends State<MyTabBar> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.directions_car)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_bike)),
//               ],
//             ),
//             title: Text('Tabs Demo'),
//           ),
//           body: TabBarView(
//             children: [
//               Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.directions_bike),
//             ],
//           ),
//         ),
//       ),
//     );
//   }}