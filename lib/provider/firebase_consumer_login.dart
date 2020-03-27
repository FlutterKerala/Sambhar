import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseLogin with ChangeNotifier {
  Future<bool> userLoginData(String phone) async {

    String temp = phone.substring(3, phone.length);
    print('number $temp');
    var fireBaseQuery = Firestore.instance
        .collection('Consumer')
        .where("phone", isEqualTo: temp);

    QuerySnapshot eventsQuery = await fireBaseQuery.getDocuments();

    print(eventsQuery.documents);
    print('object');

    if (eventsQuery.documents.isNotEmpty) {
      return true;
    }else{
      return false;
    }
  }
}
