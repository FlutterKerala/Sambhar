import 'package:flutter/material.dart';
import 'package:sambharapp/models/category_model.dart';

class GridCardsView extends StatelessWidget {
  GridCardsView({
    @required this.categoryname,
  });

  final String categoryname;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 6.25,
                offset: Offset(0, 4.1))
          ]),
      child: Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categoryname),
              ))),
    );
  }
}
