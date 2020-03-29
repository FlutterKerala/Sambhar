import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  String _category;

  ProductCategory(this._category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category),
      ),
      body: StreamBuilder(
        // stream: Firestore.instance.collection(''),
      ),
    );
  }
}
