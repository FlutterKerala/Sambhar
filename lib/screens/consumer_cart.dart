import 'package:flutter/material.dart';

class ConsumerCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Container(),
    );
  }
}
