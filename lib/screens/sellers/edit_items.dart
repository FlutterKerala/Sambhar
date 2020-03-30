import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_data_queries.dart';
import 'package:sambharapp/widgets/dashboard_app_bar.dart';
import 'package:sambharapp/widgets/inputs.dart';
import 'package:sambharapp/widgets/sub_txt_widgets.dart';

class EditIteams extends StatefulWidget {
  static const String routeName = './EditIteams';

  @override
  _EditIteamsState createState() => _EditIteamsState();
}

class _EditIteamsState extends State<EditIteams> {
  DocumentSnapshot documnet;
  List documnetsPassed;
  String _sellersDoc;
  String _priceVal;
  String _stockVal;
  bool _isLoading = false;
  Future<void> updateQerryHandler() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<FirebaseDataQuieriesSellers>(context, listen: false)
        .quieriesHandlerUpadte(_sellersDoc, documnet.documentID, {
      'price': double.parse(_priceVal),
      'stock': double.parse(_stockVal),
    });

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

 Future<void> deleteQuerryHandler() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<FirebaseDataQuieriesSellers>(context, listen: false)
        .quieriesHandlerUpadte(_sellersDoc, documnet.documentID, {
      'availability': false,
    });

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {

    documnetsPassed = ModalRoute.of(context).settings.arguments as List;
    documnet = documnetsPassed[0];
    _sellersDoc = documnetsPassed[1];
    _priceVal = documnet.data['price'].toString();
    _stockVal = documnet.data['stock'].toString();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: dashboardAppBar('Edit Review'),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenheight * 0.1,
                ),
                Row(
                  children: <Widget>[
                    Container(
                        width: 60,
                        height: 60,
                        child: Image.network(documnet.data['imageUrl'])),
                    SizedBox(
                      width: 20,
                    ),
                    textCard(documnet.data['name']),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                inputStyles(context, documnet.data['price'].toString(), 'Rs.',
                    (val) {
                  _priceVal = val;
                }),
                SizedBox(
                  height: 20,
                ),
                inputStyles(context, documnet.data['stock'].toString(), 'Stock',
                    (val) {
                  _stockVal = val;
                }),
                SizedBox(
                  height: 20,
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : okButn(screenWidth),
                dltBtn(screenWidth)
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox dltBtn(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: deleteQuerryHandler,
          color: Color.fromRGBO(236, 242, 247, 1),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Delete items',
              style: TextStyle(
                color: Color.fromRGBO(94, 191, 70, 1),
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox okButn(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: updateQerryHandler,
          color: Color.fromRGBO(94, 191, 70, 1),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Edit item',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container inputStyles(
      BuildContext context, hintText, preffix, Function controllers) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: textFieldDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            preffix,
            style: TextStyle(color: Color.fromRGBO(94, 191, 70, 1)),
          ),
          Expanded(
            child: TextField(
              onChanged: controllers,
              cursorColor: Theme.of(context).accentColor,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Color.fromRGBO(94, 191, 70, 1)),
                contentPadding: EdgeInsets.only(left: 5),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
