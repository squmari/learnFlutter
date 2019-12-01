// import 'package:flutter/material.dart';
// import 'package:learn_flutter/main.dart';
// import 'package:learn_flutter/widget/myGridList.dart';

// class InheritedBottomNaviTest extends StatefulWidget {
//     final String title = 'test';
//   InheritedBottomNaviTest() : super();

//   @override
//   _InheritedBottomNaviTestState createState() => _InheritedBottomNaviTestState();
  
// }

// class _InheritedBottomNaviTestState extends State<InheritedBottomNaviTest> with SingleTickerProviderStateMixin{
//   int _bottomContent = 0;

//   // @override
//   // void initState() { 
//   //   // super.initState();
//   // }
  

//   @override
//   Widget build(BuildContext context) {
//     return InheritedBottomNavi(
//       child :Scaffold(
//         appBar: AppBar(title: Text(widget.title),),
//         body: bottomPageSelect(_bottomContent),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _bottomContent,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               title: Text('ホーム'),
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               title: Text('お知らせ'),
//               icon: Icon(Icons.notifications),
//             ),
//             BottomNavigationBarItem(
//               title: Text('マイページ'),
//               icon: Icon(Icons.account_circle),
//             ),
//           ],
//           onTap: tapBottomNavi,
//         ),
//       ),
//     );
//   }
//   void tapBottomNavi(int _index){
//     setState(() {
//       _bottomContent = _index;
//     });
//   }

//   GridView bottomPageSelect(int page){

//     GridView grid;

//     if (page == BottomNaviPages.HOME.index) {
//       grid = HomeGridList(30, 1).grid;
//     }
//     else if (page == BottomNaviPages.NOTIFICATIONS.index) {
//       grid = HomeGridList(30, 2).grid;
//     }
//     else if (page == BottomNaviPages.MY_PAGE.index) {
//       grid = HomeGridList(30, 3).grid;
//     }
//     return grid;
//   }

// }

// class InheritedBottomNavi extends InheritedWidget {
//   final Widget child;
//   InheritedBottomNavi({@required this.child}) : super(child: child);


//   static InheritedBottomNavi of(BuildContext context, {@required bool observe}) {
//     return observe ? context.inheritFromWidgetOfExactType(InheritedBottomNavi) : context.ancestorInheritedElementForWidgetOfExactType(InheritedBottomNavi).widget;
//   }

//   @override
//   bool updateShouldNotify(InheritedBottomNavi oldWidget) {
//     return true;
//   }
// }