
import 'package:flutter/material.dart';

 AppBar dashboardAppBar(String titleName) {
    return AppBar(
      title: Text(titleName),
      flexibleSpace: Image(
        image: AssetImage('assets/images/appbar.png'),
        fit: BoxFit.cover,
        height: double.infinity,
      ),
      actions: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
        )
      ],
    );
  }