import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sambharapp/models/consumer_model.dart';
import 'package:sambharapp/models/seller_model.dart';
import 'package:sambharapp/states/LoginStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseLogin with ChangeNotifier {
  LoginStatus _loginStatus = LoginStatus.NotLoggedIn;
  ConsumerModel consumer;
  SellerModel seller;
  String userType = "";
  String userPhone = "";
  String userName = "";
  LoginStatus get loginStatus => _loginStatus;

  FirebaseLogin() {
    FirebaseAuth.instance.currentUser().then((user) async {
      if (user != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        _loginStatus = LoginStatus.LoggedIn;
        userType = preferences.getString("type");
        await userLoginData(user.phoneNumber, userType);
        notifyListeners();
      }
    });
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut().then((value) {
      _loginStatus = LoginStatus.NotLoggedIn;
      notifyListeners();
    });
  }

  Future<bool> userLoginData(String phone, String collection) async {
    String temp = phone.substring(3, phone.length);
    var fireBaseQuery = Firestore.instance
        .collection(collection)
        .where("phone", isEqualTo: temp);

    QuerySnapshot eventsQuery = await fireBaseQuery.getDocuments();
    print(collection);
    if (collection == "Consumer") {
      consumer = ConsumerModel.fromJson(eventsQuery.documents[0].data);
      userName = consumer.name;
      userPhone = consumer.phone;
    } else {
      seller = SellerModel.fromJson(eventsQuery.documents[0].data);
      userName = seller.name;
      userPhone = seller.phone;
    }

    if (eventsQuery.documents.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
