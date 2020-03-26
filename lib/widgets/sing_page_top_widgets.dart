import 'package:flutter/material.dart';

Row siginPageTopWidgets(double screenWidth, TextStyle headingTxt,
    String firstTxt, String secoundTxt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset('assets/images/icons.png',width: 150,height: 150,),
      Container(
        width: screenWidth * 0.4,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTxt,
              style: headingTxt,
            ),
            Text(
              secoundTxt,
              style: headingTxt,
            )
          ],
        ),
      )
    ],
  );
}
