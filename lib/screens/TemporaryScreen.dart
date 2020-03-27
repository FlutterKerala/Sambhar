import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';

class TemporaryScreen extends StatelessWidget {
  static const routeName = '/TemporaryScreen';
  @override
  Widget build(BuildContext context) {
    final _firebaseProvider = Provider.of<FirebaseLogin>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text("Log Out"),
          onPressed: () {
            _firebaseProvider.signOut();
          },
        ),
      ),
    );
  }
}
