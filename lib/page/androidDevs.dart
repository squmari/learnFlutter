// import 'package:flutter/material.dart';

// class AndroidDevs extends StatefulWidget {
//   AndroidDevs({Key key}):super(key:key);

//   @override
//   _AndroidDevsState createState() => new _AndroidDevsState();
// }

// class _AndroidDevsState extends State<AndroidDevs> {

//   bool toggle = true;
//   void _toggle(){
//     setState(() {
//       toggle = !toggle;
//     });
//   }

//   _getToggleChild(){
//     if (toggle) {
//       return Text('Toggle One');
//     }
//     else{
//       return MaterialButton(
//         onPressed: (){}, 
//         child: Text('Toggle Two'),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sample App'),
//       ),
//       body: Center(
//         child:_getToggleChild(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _toggle,
//         tooltip: 'Update Text',
//         child: Icon(Icons.update),
//       ),
//     );
//   }
// }
