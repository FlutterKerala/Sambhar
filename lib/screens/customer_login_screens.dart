import 'package:flutter/material.dart';
import '../widgets/sing_page_top_widgets.dart';
import '../widgets/input_feild_code_design.dart';
import '../core/firebase_Mob_Auth.dart';

class CustomerLoginScreens extends StatefulWidget {
  @override
  _CustomerLoginScreensState createState() => _CustomerLoginScreensState();
}

class _CustomerLoginScreensState extends State<CustomerLoginScreens> with FirebaseMobAuth {

  // firebase mobile auth is a Class that can be used in  mob auth and can acess by inherte method

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _mobNumber;

  TextStyle headingTxt =
      TextStyle(color: const Color.fromRGBO(94, 191, 70, 1), fontSize: 26);

  bool _isLoading = false;

// this functions is called after the mobile varification are ended in this
// notifications are given and data are check with dataBase

  void submitProcess(bool val, bool auto) {
    if (!auto) {
        Navigator.of(context).pop();
    }
    if (!val) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Sigin failed'),
        duration: Duration(seconds: 3),
      ));
    }

    // enter the validation for account checking through database and more in here

    setState(() {
      _isLoading = false;
    });
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
            Container(
              width: screenWidth * 0.6,
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Please enter your details to Signup',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  )),
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
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(5),
                        decoration: textfeildDecoration,
                        child: TextFormField(
                            decoration: innerInputFeildDecoration(
                                context, 'Mobile Number'),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val.length > 10 || val.length < 10) {
                                return 'enter valid mobile number';
                              }

                              if (val == '') {
                                return 'enter your Mobile number';
                              }
                              _mobNumber = val;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : FlatButton(
                              onPressed: () {
                                _formKey.currentState.validate();
                                if (_mobNumber != null) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  _mobNumber = '+91$_mobNumber';
                                  // this is where the the firebase mob auth functionis called
                                  // This was connected to this class by inherite method 
                                  loginUser(_mobNumber, context, submitProcess);
                                }
                              },
                              child: Container(
                                  width: screenWidth * 0.7,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 30),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(5.0),
                                      )),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Sign up as a Seller',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  )))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

}
