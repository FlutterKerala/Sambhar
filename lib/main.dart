import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';
import 'package:sambharapp/provider/provider_category_provider.dart';
import 'package:sambharapp/screens/TemporaryScreen.dart';
import 'package:sambharapp/screens/login_selector.dart';
import 'package:sambharapp/screens/product_category.dart';
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
        ChangeNotifierProvider(
          create: (context) => ProductCategoryProvider(),
        ),
      ],
      child: MaterialApp(
        theme: mainThemes(),
        routes: {
          TemporaryScreen.routeName: (ctx) => TemporaryScreen(),
        },
        // home: ProductCategory('123456'),
        home: Consumer<FirebaseLogin>(
          builder: (context, firebaseprovider, child) {
            // return ProductCategory('123456');
            // Checks If User Is Already Logged In Or Not
            if (firebaseprovider.loginStatus ==
                LoginStatus
                    .LoggedIn) if (firebaseprovider.userType == "consumer")
              return TemporaryScreen(); //If User Is Consumer Push To Consumer Dash
            else
              return TemporaryScreen(); // Else Push To Seller Page
            else
              return LoginSelector(); //Else To Login Selector Page
          },
        ),
      ),
    );
  }
}
