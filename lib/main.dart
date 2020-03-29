import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';
import 'package:sambharapp/screens/consumer_dashboard.dart';
import 'package:sambharapp/screens/login_selector.dart';
import 'package:sambharapp/screens/sellers/edit_items.dart';
import 'package:sambharapp/states/LoginStatus.dart';
import './screens/sellers/sellers_dashboard.dart';
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
          debugShowCheckedModeBanner: false,
          theme: mainThemes(),
          routes: {
            ConsumerDashboard.routeName: (ctx) => ConsumerDashboard(),
            EditIteams.routeName: (ctx) => EditIteams(),
          },
          home: Consumer<FirebaseLogin>(
            builder: (context, firebaseprovider, child) {
              // Checks If User Is Already Logged In Or Not
              if (firebaseprovider.loginStatus ==
                  LoginStatus
                      .LoggedIn) if (firebaseprovider.userType == "Consumer")
                return ConsumerDashboard(); //If User Is Consumer Push To Consumer Dash
              else
                return SellerDashboard(); // Else Push To Seller Page
              else
                return LoginSelector(); //Else To Login Selector Page
            },
          )),
    );
  }
}
