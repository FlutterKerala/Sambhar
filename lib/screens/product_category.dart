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
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).accentColor,
      ),

      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Seller')
            .document(widget.pincode)
            .collection('Sellers')
            .getDocuments()
            .asStream(),
        builder: (context, snapshot) {
          //Have to display list with the datas
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
