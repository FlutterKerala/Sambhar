import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConsumerSignUp extends StatefulWidget {
  @override
  _ConsumerSignUpState createState() => _ConsumerSignUpState();
}

class _ConsumerSignUpState extends State<ConsumerSignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _dateTime;
  String _gender;
  List<String> _genderList;

  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _addressController;

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

  TextStyle headingTxt =
      TextStyle(color: const Color.fromRGBO(94, 191, 70, 1), fontSize: 26);

  TextStyle _logoHeader = TextStyle(
    color: Colors.green,
    fontSize: 30.0,
  );

  TextStyle _labelStyle = TextStyle(
    color: Colors.green,
    fontSize: 20.0,
  );

  TextStyle _buttonText = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
  );

  @override
  void initState() {
    super.initState();
    _gender = 'Choose Gender';
    _genderList = ['Choose Gender', 'Male', 'Female', 'Other'];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Container(
            padding: EdgeInsets.only(
              left: 50.0,
              right: 50.0,
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _headerRow(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: screenWidth * 0.8,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 5.0,
                        ),
                        decoration: textfeildDecoration,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromRGBO(94, 191, 70, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 5.0,
                        ),
                        decoration: textfeildDecoration,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone',
                            hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromRGBO(94, 191, 70, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 20.0,
                        ),
                        decoration: textfeildDecoration,
                        child: Text(
                          'DOB',
                          style: TextStyle(
                            color: Color.fromRGBO(94, 191, 70, 1),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromRGBO(94, 191, 70, 1),
                          ),
                        ),
                        isExpanded: true,
                        style: _labelStyle,
                        value: _gender,
                        items: _genderList
                            .map((item) => DropdownMenuItem(
                                  child: Container(
                                    width: screenWidth * 0.8,
                                    // margin: EdgeInsets.symmetric(vertical: 10.0),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                      vertical: 20.0,
                                    ),
                                    decoration: textfeildDecoration,
                                    child: Text(
                                      '$item',
                                      style: _labelStyle,
                                    ),
                                  ),
                                  value: item,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 5.0,
                        ),
                        decoration: textfeildDecoration,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address',
                            hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromRGBO(94, 191, 70, 1),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {},
                            color: Color.fromRGBO(94, 191, 70, 1),
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Sign up as a Seller',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
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

  _headerRow() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/images/icons.png',
            ),
            Text(
              'Consumer\nSignup',
              style: _logoHeader,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 5.0,
          ),
          child: Text(
            "Please enter your details to sign up",
            style: TextStyle(
              color: Color.fromRGBO(94, 191, 70, 1),
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
