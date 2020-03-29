import 'package:flutter/material.dart';

class CartRefreshing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
