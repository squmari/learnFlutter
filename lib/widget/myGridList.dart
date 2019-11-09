import 'package:flutter/material.dart';

GridView myGridList (int row, int col,[double rowSpace = 0, double colSpace = 0]){
  return GridView.count(
    crossAxisCount: col,
    mainAxisSpacing: rowSpace,
    crossAxisSpacing: colSpace,
    children: List.generate(row, (index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Stack(
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(0.0),
                    elevation: 5.0,
                    child:Image.asset(
                      'images/lake.jpg',
                      width: 600,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Wrap(
                      // spacing: 4.0, // gap between adjacent chips
                      // runSpacing: 2.0, // gap between lines
                      children: <Widget>[
                        Opacity(
                          opacity: 0.8,
                          child:Chip(
                            backgroundColor: Colors.grey.shade500,
                            label: Text(
                              '￥10,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                                ),
                              ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text('test'),
          ),
        ],
      );
    }),
  );
}