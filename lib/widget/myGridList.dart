import 'package:flutter/material.dart';
import 'package:learn_flutter/widget/myCard.dart';

abstract class MyGridList {
  GridView grid;
  int _row, _col;
  double _rowSpace, _colSpace;

  MyGridList(this._row, this._col,[this._rowSpace = 0, this._colSpace = 0]){
    grid = this.createGrid();
  }

  GridView createGrid(){
    return GridView.count(
      crossAxisCount: this._col,
      mainAxisSpacing: this._rowSpace,
      crossAxisSpacing: this._colSpace,
      children: List.generate(this._row, (index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Stack(
                  children: this._setContents(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> _setContents();

}

class HomeGridList extends MyGridList {

  HomeGridList(int _row, int _col,[double _rowSpace = 0, double _colSpace = 0]):super(_row, _col, _rowSpace, _colSpace);
  
  @override
  List<Widget> _setContents(){
    List<Widget> _contents = [
      ShopItemCard().createCard(),
      Container(
        alignment: Alignment.bottomLeft,
        child: Wrap(
          children: <Widget>[
            Opacity(
              opacity: 0.8,
              child:Chip(
                backgroundColor: Colors.black12,
                label: Text(
                  '￥10,000',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    ];
    return _contents;
  }
}
