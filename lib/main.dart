import 'package:flutter/material.dart';
import 'package:sambharapp/screens/customer_login_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomerLoginScreens(),
    );
  }
}

