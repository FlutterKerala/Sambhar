import 'package:flutter/material.dart';

BoxDecoration textfeildDecoration = BoxDecoration(
  color: const Color.fromRGBO(232, 238, 243, 1),
  borderRadius: new BorderRadius.all(
    const Radius.circular(10.0),
  ),
  boxShadow: [
    BoxShadow(
      color: const Color.fromRGBO(12, 7, 90, 0.1),
      offset: const Offset(0.0, 0.0),
    ),
    BoxShadow(
      color: const Color.fromRGBO(12, 7, 90, 0.1),
      offset: const Offset(0.0, 1.17),
      spreadRadius: -8.0,
      blurRadius: 8.0,
    ),
  ],
);

InputDecoration innerInputFeildDecoration(
    BuildContext context, String placeholder) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: placeholder,
    contentPadding: EdgeInsets.only(left: 10),
    hintStyle: TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
  );
}
