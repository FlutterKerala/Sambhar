import 'package:flutter/material.dart';

Row siginPageTopWidgets(double screenWidth, TextStyle headingTxt,
    String firstTxt, String secondTxt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset(
        secondTxt.contains("Shop")
            ? 'assets/images/shop.png'
            : 'assets/images/icons.png',
        width: 140,
        height: 140,
      ),
      Container(
        width: screenWidth * 0.38,
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
              secondTxt,
              style: headingTxt,
            )
          ],
        ),
      )
    ],
  );
}
