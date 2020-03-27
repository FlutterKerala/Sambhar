import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sambharapp/models/consumer_model.dart';
import 'package:sambharapp/models/seller_model.dart';
import 'package:sambharapp/widgets/sign_page_top_widgets.dart';

class AddShop extends StatefulWidget {
  @override
  _AddShopState createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  TextStyle headingTxt = TextStyle(
      color: const Color.fromRGBO(94, 191, 70, 1),
      fontSize: 25,
      fontWeight: FontWeight.w700);

  SellerModel model;
  double screenWidth;
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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _shopnameController,
      _shopLocController,
      _pincodeController,
      _gstidController;

  @override
  void initState() {
    super.initState();
    model = SellerModel();
    _shopnameController = TextEditingController();
    _shopLocController = TextEditingController();
    _pincodeController = TextEditingController();
    _gstidController = TextEditingController();
  }

  _shopnameTextField() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      decoration: textfeildDecoration,
      child: TextFormField(
        controller: _shopnameController,
        validator: (value) {
          if (value.isEmpty || value.trim().isEmpty)
            return 'Enter a valid shop name';
          else
            return null;
        },
        cursorColor: Theme.of(context).accentColor,
        onSaved: (value) => model.shopname = value,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Shop Name',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }

  _shopLocTextField() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      decoration: textfeildDecoration,
      child: TextFormField(
        cursorColor: Theme.of(context).accentColor,
        controller: _shopLocController,
        validator: (value) {
          if (value.isEmpty || value.trim().isEmpty)
            return 'Enter a valid shop location';
          else
            return null;
        },
        onSaved: (value) => model.shoploc = value,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Shop Location',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }

  _pinCodeTextField() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      decoration: textfeildDecoration,
      child: TextFormField(
        controller: _pincodeController,
        validator: (value) {
          if (value.isEmpty || value.trim().isEmpty)
            return 'Enter a valid shop pin code';
          else
            return null;
        },
        onSaved: (value) => model.shoppin = value,
        keyboardType: TextInputType.number,
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Pin code',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }

  _gstidTextField() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      decoration: textfeildDecoration,
      child: TextFormField(
        cursorColor: Theme.of(context).accentColor,
        controller: _gstidController,
        validator: (value) {
          if (value.isEmpty)
            return 'Enter a valid GSTID';
          else
            return null;
        },
        onSaved: (value) => model.address = value,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'GST ID (Optional)',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }

  _signUpButton() {
    return SizedBox(
      width: screenWidth * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () => _signUp(),
          color: Theme.of(context).accentColor,
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Sign Up',
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

  _signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Firestore.instance
          .collection('Consumer')
          .document()
          .setData(model.toJson())
          .then((snapshot) {
        _shopnameController.clear();
        _shopLocController.clear();
        _pincodeController.clear();
        _gstidController.clear();
      });
    } else
      print("Not success");
  }

  void scheduleRebuild() {
    setState(() {});
  }

  Padding infoText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        "Add your shop details",
        style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Container(
            padding: EdgeInsets.only(
              left: 50.0,
              right: 50.0,
              top: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                siginPageTopWidgets(screenWidth, headingTxt, "Add", "Shop"),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      infoText(context),
                      _shopnameTextField(),
                      _shopLocTextField(),
                      _pinCodeTextField(),
                      _gstidTextField(),
                      _signUpButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}