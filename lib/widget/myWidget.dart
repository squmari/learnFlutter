import 'package:flutter/material.dart';
import 'package:learn_flutter/page/counterScreen.dart';

class MyWidget extends StatefulWidget {
  final String title;
  MyWidget({Key key, this.title = 'my'}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ImportantData importantData = ImportantData();
  GlobalKey<AnotherWidgetState> anotherWidgetStateGlobalKey = GlobalKey();

  _doImportantThings(){
    setState(() {
      importantData.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Mywidget is built");

    return Inherited(
      importantData:importantData,
      child :Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("My Widget"),
              Text("Another Widget Direct Reference ${anotherWidgetStateGlobalKey.currentState?.widget?.importantData?.count ?? "empty"}"),
              AnotherWidget(key: anotherWidgetStateGlobalKey, importantData: importantData),
              NoRefToImportantDataWidget(),
              // CounterScreen(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _doImportantThings,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.green,
      )
    );
  }
}

class ImportantData {
  int count = 0;
  increment(){
    this.count++;
  }
}

class AnotherWidget extends StatefulWidget {
  final ImportantData importantData;
  AnotherWidget({Key key, @required this.importantData}) : assert(importantData != null), super(key: key);

  @override
  AnotherWidgetState createState() => AnotherWidgetState();
}

class AnotherWidgetState extends State<AnotherWidget> {
  ImportantData get _importantData => widget.importantData;
  @override
  Widget build(BuildContext context) {
    debugPrint("AnotherWidget is built");
    return Container(
      height: 400,
      decoration: BoxDecoration(color:Colors.amber),
      child: Column(
        children: <Widget>[
          Text('Another Widget'),
          YetAnotherWidget(importantData : _importantData),
        ],
      ),
    );
  }
}

class YetAnotherWidget extends StatefulWidget {
  final ImportantData importantData;
  YetAnotherWidget({Key key, @required this.importantData}) : assert(importantData != null), super(key: key);

  @override
  _YetAnotherWidgetState createState() => _YetAnotherWidgetState();
}

class _YetAnotherWidgetState extends State<YetAnotherWidget> {
  ImportantData get _importantData => widget.importantData;
  @override
  Widget build(BuildContext context) {
    debugPrint("YetAnotherWidget is built");
    return Container(
      height: 300,
      decoration: BoxDecoration(color:Colors.cyan),
      child: Column(
        children: <Widget>[
          Text('YetAnother Widget'),
          ThisIsJustRidiculousWidget(importantData : _importantData),
        ],
      ),
    );
  }
}


class ThisIsJustRidiculousWidget extends StatefulWidget {
  final ImportantData importantData;
  ThisIsJustRidiculousWidget({Key key, @required this.importantData}) : assert(importantData != null), super(key: key);

  @override
  _ThisIsJustRidiculousWidgetState createState() => _ThisIsJustRidiculousWidgetState();
}

class _ThisIsJustRidiculousWidgetState extends State<ThisIsJustRidiculousWidget> {
  ImportantData get _importantData => widget.importantData;
  @override
  Widget build(BuildContext context) {
    debugPrint("ThisIsJustRidiculousWidget is built");
    return Container(
      height: 200,
      decoration: BoxDecoration(color:Colors.deepPurpleAccent),
      child: Column(
        children: <Widget>[
          Text('YetAnother Widget'),
          Text("importantData is ${_importantData.count}"),
        ],
      ),
    );
  }
}

class NoRefToImportantDataWidget extends StatefulWidget {
  NoRefToImportantDataWidget({Key key}) : super(key: key);

  @override
  _NoRefToImportantDataWidgetState createState() => _NoRefToImportantDataWidgetState();
}

class _NoRefToImportantDataWidgetState extends State<NoRefToImportantDataWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint("_NoRefToImportantDataWidgetState is built");
    Inherited.of(context, observe : true).inheritedPrint();
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.red),
      child: Column(
        children: <Widget>[
          Text("NoRefToImportantDataWidget"),
          Text("Inherited Widget data is ${Inherited.of(context, observe : true).importantData.count}"),
        ],
      ),
    );
  }
}

class Inherited extends InheritedWidget {
  final ImportantData importantData;
  const Inherited({Key key, @required this.importantData, @required Widget child}) : super(key: key, child: child);

  void inheritedPrint(){
    debugPrint('Inherited');
  }

  static Inherited of(BuildContext context, {@required bool observe}) {
    return observe ? context.inheritFromWidgetOfExactType(Inherited) : context.ancestorInheritedElementForWidgetOfExactType(Inherited).widget;
  }

  @override
  bool updateShouldNotify( Inherited oldWidget) {
    return oldWidget.importantData.count <= importantData.count;
  }
}