import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sambharapp/widgets/input_feild_code_design.dart';

class FirebaseMobAuth {
  final _codeController = TextEditingController();
// firbase mobile auth Functions
  Future<bool> loginUser(
      String phone, BuildContext context, Function submitProcess) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential credential) async {
          AuthResult result = await _auth.signInWithCredential(credential);
          FirebaseUser user = result.user;

          if (user != null) {
            print('verification is done automatically and sucess');
            submitProcess(true, true);
          } else {
            print('error');
            submitProcess(false, true);
          }
        },
        verificationFailed: (AuthException exception) {
          print(exception.message);
          submitProcess(false, true);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          // this is where the sms are check manually
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text('Enter your Code'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        decoration:
                            innerInputFeildDecoration(context, 'SMS CODE'),
                        keyboardType: TextInputType.number,
                        controller: _codeController,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () async {
                          final code = _codeController.text.trim();
                          AuthResult result;
                          try {
                            AuthCredential credential =
                                PhoneAuthProvider.getCredential(
                                    verificationId: verificationId,
                                    smsCode: code);

                            result =
                                await _auth.signInWithCredential(credential);
                          } catch (e) {
                            // print('catch error');
                            submitProcess(false, false);
                            // print(e);
                            return;
                          }

                          FirebaseUser user = result.user;
                          if (user != null) {
                            print(
                                'verification is done automatically and sucess');
                            submitProcess(true, false);
                          } else {
                            print('error');
                            submitProcess(false, false);
                          }
                        },
                        child: Text('Conform'))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }
}
