import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';
import 'package:sambharapp/widgets/dashboard_app_bar.dart';
import 'package:sambharapp/widgets/items_grid_card_veiws.dart';
import 'package:sambharapp/widgets/list_vewi_product.dart';

class SellerDashboard extends StatefulWidget {
  static const routeName = './sellers_dashboard.dart';

  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  String _mobNumber;
  String _docId;
  bool _isLoading = true;
  Future<void> dataCollection() async {
    _mobNumber = Provider.of<FirebaseLogin>(context).seller.phone;
    print(_mobNumber);
    var fireBaseQuery = Firestore.instance
        .collection('Seller')
        .where("phone", isEqualTo: _mobNumber);

    QuerySnapshot eventsQuery = await fireBaseQuery.getDocuments();

    _docId = eventsQuery.documents[0].documentID;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    dataCollection();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screnWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: dashboardAppBar('Inventory Review'),
      body: SingleChildScrollView(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Container(
                  width: screnWidth * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      ListViewBuilderProducts(
                          stremData: Firestore.instance
                              .collection('Seller')
                              .document(_docId)
                              .collection('products')
                              .snapshots()),
                      SizedBox(
                        height: 50,
                      ),
                      ItemsGridViewCard(
                        titleName: 'Add Items',
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
