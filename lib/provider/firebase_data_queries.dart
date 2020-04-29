import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseDataQuieriesSellers with ChangeNotifier {
  final databaseReference = Firestore.instance;

  Future<void> quieriesHandlerUpadte(String sellerId, String productid,
      Map<String, dynamic> updateData) async {
    try {
      await databaseReference
          .collection('Seller')
          .document(sellerId)
          .collection('products')
          .document(productid)
          .updateData(updateData);
    } catch (e) {
      print(e.toString());
    }
  }
}
