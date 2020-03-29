import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sambharapp/models/product_model.dart';
import 'package:sambharapp/states/AsyncFetchStatus.dart';

class ProductCategoryProvider with ChangeNotifier {
  AsyncFetchStatus _status = AsyncFetchStatus.Uninitialised;
  String pincode = "";

  List<ProductModel> _products = [];
  List<String> _ids = [];

  QuerySnapshot _snapshots;

  Firestore _database = Firestore.instance;

  List<ProductModel> get products => _products;
  AsyncFetchStatus get fetchingSatus => _status;

  ProductCategoryProvider() {
    _getParentData();
  }

  _getParentData() async {
    _status = AsyncFetchStatus.Fetching;
    _snapshots =
        await _database.collection('Seller').getDocuments().then((snapshot) {
      _status = AsyncFetchStatus.Fetched;
    });
    notifyListeners();
  }

  Future<List<ProductModel>> getMe(String pincode) async {
    print("Received pincode : $pincode");
    
  }
}
