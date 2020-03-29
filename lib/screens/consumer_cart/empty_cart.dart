import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
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
          child: Text("Uh! oh. Cart is empty!"),
        ),
      ),
    );
  }
}
