import 'package:flutter/material.dart';
import 'package:learn_flutter/template/androidDevs.dart';
import 'package:learn_flutter/template/animateWidget.dart';
import 'package:learn_flutter/template/diagramTheLayout.dart';
import 'package:learn_flutter/widget/myGridList.dart';
import 'package:learn_flutter/widget/myTabBar.dart';

class TopPage extends StatefulWidget {

  final int row, col;
  final String title;
  TopPage(this.row,this.col,[this.title = 'Top Page']):super();
  
  @override
  _TopPageState createState() => new _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin{

  List _drawerItems = <Widget>[];
  int _bottomTabIndex = 0;

  final List<Tab> _topTab = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  TabController _tabController;
  

  @override
  void initState() {
    super.initState();
    _tabController = MyTabBar(this, _topTab.length).ab();
    // _tabController = TabController(
    //   vsync: this,
    //   length: _topTab.length,
    // );
    _createDrawerItem(5);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            controller: _tabController,
            tabs: _topTab,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _topTab.map((Tab tab) {
            return createTopTab(tab);
          }).toList(),
        ),
        drawer: Drawer(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: _drawerItems,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomTabIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('bottom'),
              icon: Icon(Icons.android),
            ),
            BottomNavigationBarItem(
              title: Text('bottom'),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('bottom'),
              icon: Icon(Icons.access_alarm),
            ),
          ],
          onTap: tapBottomIcon,
        ),

      ),
    );


  }

  void tapBottomIcon(int value){
    setState(() {
      print(value);
      if (value == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuildingLayoutsTutorial()),
        );
        
      } else if(value == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AndroidDevs()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnimateWidget()),
        );
      }
    });
  }

  void _createDrawerItem(int length){
    for (var i = 0; i < length; i++) {
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: Text('No, $i'),
        onTap: (){
          _tapDrawerItem();
        },
      );
      _drawerItems.add(item);
    }
  }

  void _tapDrawerItem(){
    // Navigator.pop(context);
    // setState(() {
    //   _message = 'tapped:[$_tapped]';
    // });
  }

  void pushImage(){
    setState(() {
      print("test");
    });
  }

  Widget createTopTab(Tab tab){
    return myGridList(20, 3,pushImage);
  }



}

