import 'package:flutter/material.dart';
import '../widgets/sing_page_top_widgets.dart';
import '../widgets/input_feild_code_design.dart';

class CustomerLoginScreens extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();

  TextStyle headingTxt =
      TextStyle(color: const Color.fromRGBO(94, 191, 70, 1), fontSize: 26);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                        child: TextField(
                          decoration:
                              innerInputFeildDecoration(context, 'Username'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(5),
                        decoration: textfeildDecoration,
                        child: TextField(
                          decoration:
                              innerInputFeildDecoration(context, 'Password'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                          onPressed: () {},
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
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Sign up as a Seller',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
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
