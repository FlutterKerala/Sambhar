import 'package:flutter/material.dart';
import 'package:sambharapp/widgets/grid_card_views_design.dart';
import '../dummy_data/category_data.dart';

class ItemsGridViewCard extends StatelessWidget {
  ItemsGridViewCard({
    @required this.titleName,
  });
  final String titleName;

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        dashboadSubHaeding(),
        const SizedBox(
          height: 30,
        ),
        Container(
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: categoryCard.length,
              itemBuilder: (context, index) {
                return GridCardsView(
                  categoryname: categoryCard[index].catergoryName,
                );
              }),
        ),
      ],
    );
  }

  Text dashboadSubHaeding() {
    return Text(
      titleName,
      style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(94, 191, 70, 1)),
    );
  }
}
