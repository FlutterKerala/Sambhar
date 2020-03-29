import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sambharapp/models/cart_item.dart';
import 'package:sambharapp/states/CartStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  SharedPreferences _preferences;
  double _price = 0.0;

  CartStatus _cartStatus = CartStatus.Uninitialised;

  //getters

  CartStatus get cartStatus => _cartStatus;
  List<CartItem> get cartItems => [..._cartItems];
  String get price => _price.toString();

  CartProvider() {
    _cartStatus = CartStatus.Refreshing;
    notifyListeners();
    _getCartItems();
  }

  _getCartItems() async {
    List<String> _deserialisableCartItems = [];
    _cartItems.clear();

    _preferences = await SharedPreferences.getInstance();
    if (_preferences.containsKey('cartItem') &&
        _preferences.getStringList('cartIem').isNotEmpty) {
      _deserialisableCartItems = _preferences.getStringList('cartItems');
      for (String item in _deserialisableCartItems) {
        CartItem _cartItem = json.decode(item);
        _cartItems.add(_cartItem);
        // print(item);
      }
    }
    if (_cartItems.isNotEmpty)
      _cartStatus = CartStatus.CartIsNotEmpty;
    else
      _cartStatus = CartStatus.CartIsEmpty;
    _price = calculatePrice();
    notifyListeners();
  }

  double calculatePrice() {
    double temp = 0;
    for (CartItem item in _cartItems) temp += (item.quantity * item.price);
    return temp;
  }
}
