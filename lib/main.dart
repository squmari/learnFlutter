import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final title = 'Flutter サンプル';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(
        title: this.title,
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  // final String message;
  final String title;

  MyHomePage({this.title}):super();


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message;

  @override
  void initState() {
    super.initState();
    _message = 'Hello';
  }
  
  void _setMessage(){
    if(_message == "タップしました"){
      setState(() {
        _message = 'Hello';
      });
    }
    else{
      setState(() {
        _message = 'タップしました';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Text(
        _message,
        style: TextStyle(fontSize: 32),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage,
        tooltip: 'set message',
        child: Icon(Icons.star),
      ),
    );
  }
}