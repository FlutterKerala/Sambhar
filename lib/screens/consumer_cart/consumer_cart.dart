import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/cart_provider.dart';
import 'package:sambharapp/screens/consumer_cart/cart_content.dart';
import 'package:sambharapp/screens/consumer_cart/cart_refreshing.dart';
import 'package:sambharapp/screens/consumer_cart/empty_cart.dart';
import 'package:sambharapp/states/CartStatus.dart';

class ConsumerCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);

    if (_cartProvider.cartStatus == CartStatus.CartIsEmpty)
      return CartContent(_cartProvider.cartItems, _cartProvider.price);
    else if (_cartProvider.cartStatus == CartStatus.Refreshing)
      return CartRefreshing();
    else
      return EmptyCart();
  }
}
