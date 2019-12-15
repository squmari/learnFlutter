
import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:flutter/material.dart';


enum CounterEvent{increment, decrement}

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;
  
  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state -1;
        break;
    }
  }
}

class FormBloc {

  final _changeTextController = StreamController<String>();

  StreamSink<String> get input => _changeTextController.sink;
  Stream<String> get output => _changeTextController.stream;

  void updateText(String t){
    // debugPrint(t);
    // updatePrint();
    input.add(t);
  }

  void updatePrint(){
    output.listen((t){
      debugPrint(t);
    });
  }

  void dispose(){
    _changeTextController.close();
  }

}