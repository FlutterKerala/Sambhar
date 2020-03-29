import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  String _category;

  ProductCategory(this._category);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._category),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Seller')
            .document(widget._category)
            .collection('Sellers')
            .getDocuments()
            .asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Text("No data"),
            );
          else
            return Center(
              child: Text("Data"),
            );
        },
      ),
    );
  }
}
