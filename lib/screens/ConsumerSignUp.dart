import 'dart:html';

import 'package:flutter/material.dart';

class ConsumerSignUp extends StatefulWidget {
  @override
  _ConsumerSignUpState createState() => _ConsumerSignUpState();
}

class _ConsumerSignUpState extends State<ConsumerSignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(),
          Text("Please enter your details to sign up"),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(),
                TextFormField(),
                RaisedButton(
                  child: Text("DOB"),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1920, 1),
                      lastDate: DateTime(2020, 3),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
