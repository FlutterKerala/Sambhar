import 'package:flutter/material.dart';
import 'package:sambharapp/models/cart_item.dart';
import 'package:sambharapp/widgets/ItemListTile.dart';

class CartContent extends StatelessWidget {
  List<CartItem> items;
  String price;
  CartContent(this.items, this.price);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Cart"),
            Text(items.length.toString() + ' items'),
          ],
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Container(
        padding: MediaQuery.of(context).padding,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("Full amount"),
              Text('${price.toString()}'),
              _cartItemList(items),
            ],
          ),
        ),
      ),
    );
  }

  _cartItemList(List<CartItem> cartItem) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: cartItem.map((item) {
        return ItemListTile(
          cartItem: item,
        );
      }).toList(),
    );
  }
}
