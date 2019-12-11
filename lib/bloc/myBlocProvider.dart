import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/bloc/myBloc.dart';


class MyBlocProvider extends InheritedWidget {
  const MyBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  FormBloc get bloc => FormBloc();

  @override
  bool updateShouldNotify(_) => false;

  static MyBlocProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyBlocProvider);
  }
}