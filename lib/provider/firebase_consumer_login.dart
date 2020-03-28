import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sambharapp/states/LoginStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseLogin with ChangeNotifier {
  LoginStatus _loginStatus = LoginStatus.NotLoggedIn;
  String userType = "";
  LoginStatus get loginStatus => _loginStatus;

  FirebaseLogin() {
    FirebaseAuth.instance.currentUser().then((user) async {
      if (user != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        _loginStatus = LoginStatus.LoggedIn;
        userType = preferences.getString("type");
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
    debugPrint('number $temp');
    var fireBaseQuery = Firestore.instance
        .collection(collection)
        .where("phone", isEqualTo: temp);

    QuerySnapshot eventsQuery = await fireBaseQuery.getDocuments();

    debugPrint(eventsQuery.documents.toString());
    debugPrint('object');

    if (eventsQuery.documents.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
