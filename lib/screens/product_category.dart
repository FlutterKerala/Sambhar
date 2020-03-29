import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  String pincode, category;

  ProductCategory({this.pincode, this.category});

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
<<<<<<< HEAD
      body:// StreamBuilder(
        // stream: Firestore.instance.collection('')),
        Center(),
      
=======
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Seller')
            .document(widget.pincode)
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
>>>>>>> adbf982d53fdf0d14d6162189c350684f8e7887a
    );
  }
}
