import 'package:flutter/material.dart';
import 'package:learn_flutter/page/myPage.dart';
import 'package:learn_flutter/page/notifications.dart';
import 'package:learn_flutter/widget/myAppBar.dart';
import 'package:learn_flutter/widget/myBottomTabBar.dart';
import 'package:learn_flutter/widget/myCard.dart';
import 'package:learn_flutter/widget/myGridList.dart';
import 'package:learn_flutter/widget/myTabBar.dart';
import 'package:learn_flutter/main.dart';

class Home extends StatefulWidget {

  final String title;
  Home([this.title = 'Home']):super();
  
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  HomeTabBar _homeTabBar;
  TabController _tabController;
  int _bottomContent = 0;


  final List<Tab> _topTabs = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  @override
  void initState() {
    super.initState();
    this._homeTabBar = HomeTabBar(this, _topTabs.length, _topTabs);
    this._tabController = this._homeTabBar.controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HomeAppBar(widget.title, this._tabController, this._topTabs).appBar,
        body:  bottomPageSelect(_bottomContent),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomContent,
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
          onTap: tapBottomNavi,
        ),
      ),
    );

  }

  void tapBottomNavi(int _index){
    setState(() {
      _bottomContent = _index;
    });
  }

  //----------------------------------------------------------------
  //BottomNavigation関連
  //----------------------------------------------------------------
  Widget bottomPageSelect(int page){
    Widget contents;
    if (page == BottomNaviPages.HOME.index) {
      contents = _bottomNaviItemGrid(30, 3);
    }
    else if (page == BottomNaviPages.NOTIFICATIONS.index) {
      contents = _bottomNaviNotification();
    }
    else if (page == BottomNaviPages.MY_PAGE.index) {
      contents = HomeGridList(30, 1).grid;
    }
    return contents;
  }

  //BottomNaviのHomeコンテンツ
  GridView _bottomNaviItemGrid(int _itemCounts, int _col,[double _rowSpace = 0, double _colSpace = 0]){
    return GridView.count(
      crossAxisCount: _col,
      mainAxisSpacing: _rowSpace,
      crossAxisSpacing: _colSpace,
      children: List.generate(_itemCounts, (index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Stack(
                  children: _bottomNaviGridItems(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> _bottomNaviGridItems(){
    List<Widget> _contents = [
      ShopItemCard().createCard(),
      Container(
        alignment: Alignment.bottomLeft,
        child: Wrap(
          children: <Widget>[
            Opacity(
              opacity: 0.8,
              child:Chip(
                backgroundColor: Colors.black12,
                label: Text(
                  '￥10,000',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    ];
    return _contents;
  }

  //BottomNaviボタンのNotificationのコンテンツ
  Widget _bottomNaviNotification(){
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Sliver App Bar'),
            background: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'images/lake.jpg',
                  // width: 600,
                  // height: 240,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.android),
              tooltip: 'icon button',
              onPressed: (){print('push');},
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(_bottomNaviNotificationContents()),
        ),
      ],
    );
    // List<Widget> contents = [];
    // Widget content = Padding(
    //   padding: EdgeInsets.all(15.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: <Widget>[
    //       Padding(
    //         padding: EdgeInsets.only(right: 15.0),
    //         child: Icon(Icons.fiber_new, size: 40.0,color: Colors.red,),
    //       ),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Row(
    //               children: <Widget>[
    //                 Icon(Icons.access_time),
    //                 Text('3日前'),
    //               ],
    //             ),
    //             Text('販売手数料も梱包資材も実質無料！超！出品祭開催中♪大好評につき第二弾！'),
    //           ],
    //         ),
    //       ),
    //     ],
    //   )
    // );
    // for (var i = 0; i < 8; i++) {
    //   contents.add(content);
    // }
    // return Column(children: contents,);
  }

  List<Widget> _bottomNaviNotificationContents(){
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
    for (var i = 0; i < 20; i++) {
      contents.add(content);
    }
    return contents;
  }

  // void tapBottomIcon(int value){
  //   setState(() {
  //     print(value);
  //     if (value == 0) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => Home(widget.row,widget.col)),
  //       );
        
  //     } else if(value == 1) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => Notifications(widget.row,widget.col)),
  //       );
  //     }else{
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => MyPage(widget.row,widget.col)),
  //       );
  //     }
  //   });
  // }

}

