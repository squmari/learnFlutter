import 'package:flutter/material.dart';
import 'package:learn_flutter/bloc/myBloc.dart';

import 'package:learn_flutter/bloc/myBlocProvider.dart';

class BlocTest extends StatelessWidget {

  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _myBlocProvider = MyBlocProvider.of(context);
    final _myBloc = _myBlocProvider.bloc;

    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _testText(_myBloc),
              _testTextField(_myBloc),
            ],
          ),
        ),
    );
  }

  Widget _testText(FormBloc b){
    return StreamBuilder<String>(
      stream: b.output,
      builder: (context, AsyncSnapshot<String> snapshot){
        return Text(
          snapshot.hasData ? snapshot.data : "No Text", 
          style: TextStyle(fontSize: 38),
        );
      }
    );
  }

  Widget _testTextField(FormBloc b){
    return TextField(
      controller: _textFieldController,
      onChanged: (String text) => b.updateText(text),
      style: TextStyle(fontSize:20),
    );
  }


}