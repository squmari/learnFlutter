import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/myGridList.dart';

class TopPage extends StatefulWidget {

  final int row, col;
  final String title;
  TopPage(this.row,this.col,[this.title = 'Top Page']):super();
  
  @override
  _TopPageState createState() => new _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin{

  List _items = <Widget>[];
  String _message;
  int _tapped = 0;

  final List<Tab> _topTab = [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  TabController _tabController;
  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _topTab.length,
    );
    _message = 'ok';
    for (var i = 0; i < 5; i++) {
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: Text('No, $i'),
        onTap: (){
          _tapped = i;
          tapItem();
        },
      );
    _items.add(item);
    }
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
            return createTab(tab);
          }).toList(),
        ),
        // body: myGridList(widget.row, widget.col),
        drawer: Drawer(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: _items,
          ),
        ),

      ),
    );


  }

  void tapItem(){
    Navigator.pop(context);
    setState(() {
      _message = 'tapped:[$_tapped]';
    });
  }

  Widget createTab(Tab tab){
    return Center(
      child: Text('test'),
    );
  }



}

