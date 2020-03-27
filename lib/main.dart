import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';
import 'package:sambharapp/screens/TemporaryScreen.dart';
import 'package:sambharapp/screens/customer_login_screens.dart';
import 'package:sambharapp/screens/login_selector.dart';
import 'package:sambharapp/states/LoginStatus.dart';
import './themes/main_themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseLogin(),
        ),
      ],
      child: MaterialApp(
          theme: mainThemes(),
          // use this page for sign up => ConsumerSignUp(),
          home: Consumer<FirebaseLogin>(
            builder: (context, firebaseprovider, child) {
              if (firebaseprovider.loginStatus == LoginStatus.LoggedIn)
                return TemporaryScreen();
              else
                return LoginSelector();
            },
          )
          // home: CustomerLoginScreens(),
          ),
    );
  }
}
