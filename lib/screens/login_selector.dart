import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sambharapp/screens/consumer_signup.dart';
import 'package:sambharapp/screens/customer_login_screens.dart';
import 'package:sambharapp/screens/seller_signin.dart';
import 'package:sambharapp/screens/seller_signup.dart';

class LoginSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mqh = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return (_backButtonFunction(context)) ?? false;
      },
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: PreferredSize(
                  child: AppBar(
                    backgroundColor: Colors.red,
                    elevation: 0,
                    flexibleSpace: Image(
                      image: AssetImage('assets/images/sambhar-bg.png'),
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                    bottom: TabBar(
                      labelStyle: TextStyle(fontWeight: FontWeight.w700),
                      tabs: [tab("Sign In"), tab("Sign Up")],
                    ),
                  ),
                  preferredSize: Size.fromHeight(mqh * 0.3)),
              body: TabBarView(
                children: <Widget>[
                  signInTab(mqh, context),
                  signUpTab(mqh, context),
                ],
              )),
        ),
      ),
    );
  }

  Future<bool> _backButtonFunction(context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "Are you sure?",
              style: TextStyle(color: Color(0xFF5EBF46)),
            ),
            content: Text(
              "Do you want to exit?",
              style: TextStyle(color: Color(0xFF5EBF46)),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => exit(0),
                child: Text(
                  "Yes",
                  style: TextStyle(color: Color(0xFF5EBF46)),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "No",
                  style: TextStyle(color: Color(0xFF5EBF46)),
                ),
              ),
            ],
          );
        });
  }

  Tab tab(lbl) => Tab(
        text: lbl,
      );
  Center signInTab(double mqh, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: mqh * 0.15),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 350,
              height: 65,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CustomerLoginScreens()));
                },
                child: Text(
                  "Sign in as a Consumer",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor),
                ),
                elevation: 3,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 350,
              height: 60,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SellerLoginScreens()));
                  },
                  elevation: 3,
                  color: Colors.white,
                  child: Text(
                    "Sign in as a Seller",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Center signUpTab(double mqh, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: mqh * 0.15),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 350,
              height: 65,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ConsumerSignUp()));
                },
                child: Text(
                  "Sign up as a Consumer",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor),
                ),
                elevation: 3,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 350,
              height: 60,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SellerSignUp()));
                  },
                  elevation: 3,
                  color: Colors.white,
                  child: Text(
                    "Sign up as a Seller",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
