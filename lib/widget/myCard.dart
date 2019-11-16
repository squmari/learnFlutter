import 'package:flutter/material.dart';

class Test extends Card {
  Test():super();

  testCard(){
    
  }

}

Card myCard (){
  return Card(
    margin: EdgeInsets.all(50.0),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album),
          title: Text('The Enchanted Nightingale', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: const Color(0xFF000000)),),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.', style: TextStyle(fontSize: 16, color: const Color(0xFF000000)),),
        ),
        ButtonTheme.bar(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('Buy TICKET'),
                onPressed: (){},
              ),
              FlatButton(
                child: const Text('LISTEN'),
                onPressed: (){},
              ),
            ],
          ),
        ),
        // star(),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        // ),
      ],
    ),
  );
}