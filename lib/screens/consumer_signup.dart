import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sambharapp/models/consumer_model.dart';
import 'package:sambharapp/screens/consumer_dashboard.dart';
import 'package:sambharapp/widgets/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsumerSignUp extends StatefulWidget {
  @override
  _ConsumerSignUpState createState() => _ConsumerSignUpState();
}

class _ConsumerSignUpState extends State<ConsumerSignUp> {
  TextStyle headingTxt = TextStyle(
      color: const Color.fromRGBO(94, 191, 70, 1),
      fontSize: 25,
      fontWeight: FontWeight.w700);

  ConsumerModel model;
  double screenWidth;
  BoxDecoration textfieldDecoration = BoxDecoration(
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

  DateTime _dateTime;
  String _dateValue;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _gender;
  List<String> _genderList;
  TextStyle _labelStyle = TextStyle(
    color: Colors.green,
    fontSize: 20.0,
  );

  TextEditingController _nameController,
      _phoneController,
      _pincodeController,
      _addressController;

  @override
  void initState() {
    super.initState();
    model = ConsumerModel();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _pincodeController = TextEditingController();
    _addressController = TextEditingController();
    _dateValue = "DOB";
    _gender = 'Choose Gender';
    _genderList = ['Choose Gender', 'Male', 'Female', 'Other'];
  }

  _nameTextField() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      decoration: textfieldDecoration,
      child: TextFormField(
        controller: _nameController,
        validator: (value) {
          if (value.isEmpty || value.trim().isEmpty)
            return 'Enter a valid name';
          else
            return null;
        },
        cursorColor: Theme.of(context).accentColor,
        onSaved: (value) => model.name = value.trim(),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Name',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Color.fromRGBO(94, 191, 70, 1),
          ),
        ),
      ),
    );
  }

  _phoneTextField() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      decoration: textfieldDecoration,
      child: TextFormField(
        cursorColor: Theme.of(context).accentColor,
        controller: _phoneController,
        validator: (value) {
          if (value.isEmpty || value.trim().isEmpty)
            return 'Enter a valid Phone number';
          else
            return null;
        },
        onSaved: (value) => model.phone = value.trim(),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Color.fromRGBO(94, 191, 70, 1),
          ),
        ),
      ),
    );
  }

  _dob() {
    return GestureDetector(
      onTap: () {
        _getDate();
      },
      child: Container(
        width: screenWidth * 0.8,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        decoration: textfieldDecoration,
        child: Text(
          _dateValue,
          style: TextStyle(
            color: Color.fromRGBO(94, 191, 70, 1),
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  _getDate() async {
    _dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (_dateTime != null) {
      _dateValue = _dateTime.year.toString() +
          '/' +
          _dateTime.month.toString() +
          '/' +
          _dateTime.day.toString();
      model.dob = _dateTime;
    }
    scheduleRebuild();
  }

  _genderDropDown() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        // vertical: 20.0,
      ),
      decoration: textfieldDecoration,
      child: DropdownButtonFormField(
        validator: (value) {
          if (value.isEmpty || value == 'Choose Gender')
            return 'Enter a valid Gender';
          else
            return null;
        },
        onSaved: (value) => model.gender = value,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Color.fromRGBO(94, 191, 70, 1),
          ),
        ),
        // isExpanded: true,
        style: _labelStyle,
        value: _gender,
        items: _genderList
            .map((item) => DropdownMenuItem(
                  child: Text(
                    '$item',
                    style: _labelStyle,
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
      decoration: textfieldDecoration,
      child: TextFormField(
        controller: _pincodeController,
        validator: (value) {
          if (value.isEmpty || value.trim().isEmpty)
            return 'Enter a valid pin code';
          else
            return null;
        },
        onSaved: (value) => model.pincode = value.trim(),
        keyboardType: TextInputType.number,
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Pin code',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Color.fromRGBO(94, 191, 70, 1),
          ),
        ),
      ),
    );
  }

  _addressTextField() {
    return Container(
      width: screenWidth * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      decoration: textfieldDecoration,
      child: TextFormField(
        cursorColor: Theme.of(context).accentColor,
        controller: _addressController,
        validator: (value) {
          if (value.isEmpty)
            return 'Enter a valid Address';
          else
            return null;
        },
        onSaved: (value) => model.address = value.trim(),
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
          color: Color.fromRGBO(94, 191, 70, 1),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Sign up as a Consumer',
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
        _nameController.clear();
        _phoneController.clear();
        _pincodeController.clear();
        _addressController.clear();
      });
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("type", "Consumer");
      Navigator.of(context).pushReplacementNamed(ConsumerDashboard.routeName);
    } else
      debugPrint("Not success");
    scheduleRebuild();
  }

  void scheduleRebuild() {
    setState(() {});
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
                siginPageTopWidgets(
                    screenWidth, headingTxt, "Consumer", "Signup"),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _nameTextField(),
                      _phoneTextField(),
                      _dob(),
                      _genderDropDown(),
                      _pinCodeTextField(),
                      _addressTextField(),
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
