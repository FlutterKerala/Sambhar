import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/models/product_model.dart';
import 'package:sambharapp/provider/provider_category_provider.dart';
import 'package:sambharapp/states/AsyncFetchStatus.dart';

class ProductCategory extends StatefulWidget {
  String _category;

  ProductCategory(this._category);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  ProductCategoryProvider _provider;
  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<ProductCategoryProvider>(context);
    _getBody();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._category),
      ),
      body: _getBody(),
    );
  }

  _getBuild () {
    if(_provider.fetchingSatus == AsyncFetchStatus.Fetched) 
    print("Ok");
    return Center();
  }

  _getBody() async {
    await _provider.getMe('123456');
  }
}
