import 'package:flutter/material.dart';

class CustomerLoginScreens extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
            siginPageTopWidgets(screenWidth, headingTxt,'Consumer', 'Login'),
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromRGBO(94, 191, 70, 1)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(5),
                        decoration: textfeildDecoration,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromRGBO(94, 191, 70, 1)),
                          ),
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
                                  color: Color.fromRGBO(94, 191, 70, 1),
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

  Row siginPageTopWidgets(double screenWidth, TextStyle headingTxt, String firstTxt, String secoundTxt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/icons.png'),
        Container(
          width: screenWidth * 0.4,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTxt,
                style: headingTxt,
              ),
              Text(
                secoundTxt,
                style: headingTxt,
              )
            ],
          ),
        )
      ],
    );
  }
}
