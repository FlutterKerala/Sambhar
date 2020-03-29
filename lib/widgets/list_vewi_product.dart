import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListViewBuilderProducts extends StatelessWidget {
  final Stream<QuerySnapshot> stremData ;
              ListViewBuilderProducts({
              @required this.stremData,
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
                    textCard('${snapshot.data.documents.length.toString()} Items'),
                    SizedBox(
                      height: 10,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children:
                          snapshot.data.documents.map((DocumentSnapshot document) {
                        return innerListVeiw(document);
                      }).toList(),
                    ),
                  ],
                );
            }
          }),
    );
  }

  Container innerListVeiw(DocumentSnapshot document) {
    return Container(
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
        children: <Widget>[iconReplacment(), dataInsideListVeiw(document)],
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

  Text textCard(String data) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(94, 191, 70, 1),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Container iconReplacment() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            )),
      ),
    );
  }
}
