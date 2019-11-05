import 'package:flutter/material.dart';

class AnimateWidget extends StatefulWidget {
  final String title;
  AnimateWidget({Key key, this.title}):super(key:key);

  @override
  _AnimateWidgetState createState() => new _AnimateWidgetState();
}

class _AnimateWidgetState extends State<AnimateWidget> with TickerProviderStateMixin {

  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() { 
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000), vsync: this,);
      curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(opacity: curve, child: FlutterLogo(size: 100.0),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade', 
        child: Icon(Icons.brush),
        onPressed: (){
          controller.forward();
        },
      ),
    );
  }
}
