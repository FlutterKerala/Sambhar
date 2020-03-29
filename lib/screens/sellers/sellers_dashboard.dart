import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sambharapp/widgets/dashboard_app_bar.dart';
import 'package:sambharapp/widgets/items_grid_card_veiws.dart';
import 'package:sambharapp/widgets/list_vewi_product.dart';

class SellerDashboard extends StatelessWidget {
  static const routeName = './sellers_dashboard.dart';

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screnWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: dashboardAppBar(),
      body: SingleChildScrollView(
        child: Center(
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
                        .document('fzaU97tto6X8jyKndgOk')
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
