import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/bloc/myBloc.dart';
import 'package:learn_flutter/bloc/myBlocProvider.dart';
import 'package:learn_flutter/page/blocTest.dart';
import 'package:learn_flutter/page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      home: MyBlocProvider(
        child: BlocTest(),
      ),
    );
  }
}

enum BottomNaviPages{
  HOME,
  NOTIFICATIONS,
  MY_PAGE,
}