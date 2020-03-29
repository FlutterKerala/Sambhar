import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/models/cart_item.dart';
import 'package:sambharapp/provider/cart_provider.dart';
import 'package:sambharapp/widgets/ItemListTile.dart';

class ConsumerCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text("Cart"),
            Text(_cartProvider.cartItems.length.toString() + ' items'),
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
              Text('${_cartProvider.price}'),
              _cartItemList(_cartProvider.cartItems),
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
