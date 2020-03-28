import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';
import 'package:sambharapp/screens/TemporaryScreen.dart';
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
          routes: {
            TemporaryScreen.routeName: (ctx) => TemporaryScreen(),
          },
          home: Consumer<FirebaseLogin>(
            builder: (context, firebaseprovider, child) {
              // Checks If User Is Already Logged In Or Not
              if (firebaseprovider.loginStatus == LoginStatus.LoggedIn)
                return TemporaryScreen(); //If True Push To Dashboard/Home Page
              else
                return LoginSelector(); //Else To Login Selector Page
            },
          )),
    );
  }
}
