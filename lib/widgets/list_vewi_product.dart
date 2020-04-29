import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sambharapp/screens/sellers/edit_items.dart';
import 'package:sambharapp/widgets/sub_txt_widgets.dart';

class ListViewBuilderProducts extends StatelessWidget {
  final Stream<QuerySnapshot> stremData;
  final String docId;
  ListViewBuilderProducts({
    @required this.stremData,
    @required this.docId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: stremData,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    textCard(
                        '${snapshot.data.documents.length.toString()} Items'),
                    SizedBox(
                      height: 10,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return innerListVeiw(document, context);
                      }).toList(),
                    ),
                  ],
                );
            }
          }),
    );
  }

  GestureDetector innerListVeiw(
      DocumentSnapshot document, BuildContext context) {
    return GestureDetector(
      onTap: () {
        List _tempData = [document, docId];
        Navigator.of(context)
            .pushNamed(EditIteams.routeName, arguments: _tempData);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 24,
                  offset: Offset(0, 2.1))
            ]),
        child: Row(
          children: <Widget>[
            iconReplacment(document.data['imageUrl']),
            dataInsideListVeiw(document)
          ],
        ),
      ),
    );
  }

  Column dataInsideListVeiw(DocumentSnapshot document) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        textCard(document.data['name']),
        SizedBox(
          height: 5,
        ),
        textCard('Rs. ${document.data['price']}'),
        SizedBox(
          height: 5,
        ),
        textCard('${document.data['stock']} Remaining'),
      ],
    );
  }

  Container iconReplacment(String imgUrl) {
    return Container(
        margin: EdgeInsets.only(right: 30),
        height: 60,
        width: 60,
        child: Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ));
  }
}
