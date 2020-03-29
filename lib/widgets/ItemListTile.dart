import 'package:flutter/material.dart';
import 'package:sambharapp/models/cart_item.dart';

class ItemListTile extends StatelessWidget {
  CartItem cartItem;
  ItemListTile({this.cartItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
              cartItem.imageUrl,
            ),
            radius: 50.0,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('${cartItem.name}'),
                Text('${cartItem.price.toString()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
