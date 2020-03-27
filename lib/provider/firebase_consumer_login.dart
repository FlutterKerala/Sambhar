import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sambharapp/states/LoginStatus.dart';

class FirebaseLogin with ChangeNotifier {
  LoginStatus _loginStatus = LoginStatus.NotLoggedIn;

  LoginStatus get loginStatus => _loginStatus;

  FirebaseLogin() {
    FirebaseAuth.instance.currentUser().then((user) {
      if (user != null) {
        _loginStatus = LoginStatus.LoggedIn;
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
    } else {
      return false;
    }
  }
}
