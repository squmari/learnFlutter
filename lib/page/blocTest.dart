import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/bloc/myBloc.dart';
import 'dart:async';

import 'package:learn_flutter/bloc/myBlocProvider.dart';

class BlocTest extends StatelessWidget {

  final _textFieldController = TextEditingController();

  Widget _testText(FormBloc b){
    return StreamBuilder<String>(
      stream: b.inputTextController.stream,
      builder: (context, AsyncSnapshot<String> snapshot){
        return Text(
          snapshot.hasData ? snapshot.data : "", 
          style: TextStyle(fontSize: 38),
        );
      }
    );
  }

  Widget _testTextField(FormBloc b){
    return StreamBuilder<String>(
      stream: b.inputTextController.stream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          controller: _textFieldController,
          onChanged: b.inputTextController.sink.add,
          style: TextStyle(fontSize:20),
        );
      },
    );
  }



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



}