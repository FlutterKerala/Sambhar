
import 'package:flutter/material.dart';

 AppBar dashboardAppBar() {
    return AppBar(
      title: Text('Inventory Review'),
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