import 'package:flutter/material.dart';
import 'package:sambharapp/widgets/sign_page_top_widgets.dart';
import '../widgets/input_feild_code_design.dart';
import '../core/firebase_Mob_Auth.dart';

class CustomerLoginScreens extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _mobNumber;

  final TextStyle headingTxt = TextStyle(
      color: const Color.fromRGBO(94, 191, 70, 1),
      fontSize: 26,
      fontWeight: FontWeight.w700);

  bool _isLoading = false;

// this functions is called after the mobile varification are ended in this
// notifications are given and data are check with dataBase

  void submitProcess(bool val, bool auto) {
    if (!auto) {
      //    Navigator.of(context).pop();
    }
    if (!val) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Sigin failed'),
        duration: Duration(seconds: 3),
      ));
    }

    // enter the validation for account checking through database and more in here

    ///  setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.15,
            ),
            // this is the top text in the login screen last 2 para means the 1st text and 2nd text
            siginPageTopWidgets(screenWidth, headingTxt, 'Consumer', 'Login'),
            const SizedBox(
              height: 100,
            ),

            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Container(
                  width: screenWidth * 0.7,
                  child: Column(
                    children: <Widget>[
                      infoText(context),
                      nameTextField(context),
                      phoneNoTextField(context),
                      SizedBox(
                        height: 20,
                      ),
                      signupRaisedButton(screenWidth, context)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Text infoText(BuildContext context) {
    return Text(
      "Please enter your details to sign in",
      style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.w500,
          fontSize: 17),
    );
  }

  Container nameTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: textfeildDecoration,
      child: TextField(
        cursorColor: Theme.of(context).accentColor,
        decoration: innerInputFeildDecoration(context, 'Username'),
      ),
    );
  }

  Container phoneNoTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: textfeildDecoration,
      child: TextField(
        cursorColor: Theme.of(context).accentColor,
        decoration: innerInputFeildDecoration(context, 'Password'),
      ),
    );
  }

  Padding signupRaisedButton(double screenWidth, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Theme.of(context).accentColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          onPressed: () {},
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
