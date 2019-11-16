import 'package:flutter/material.dart';

abstract class MyCard {
  Card card;
  MyCard(){
    this.card = this.createCard();
  }

  Card createCard();
}

class ShopItemCard extends MyCard {
  ShopItemCard():super();
  
  @override
  Card createCard(){
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 5.0,
      child:Image.asset(
        'images/lake.jpg',
        width: 600,
        height: 240,
        fit: BoxFit.cover,
      ),
    );
  }
}