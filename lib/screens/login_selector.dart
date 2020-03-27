import 'package:flutter/material.dart';
import 'package:sambharapp/screens/consumer_signup.dart';

class LoginSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mqh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              child: Image.asset("assets/images/sambhar-bg.png"),
              preferredSize: Size.fromHeight(mqh * 0.3)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: mqh * 0.15),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    height: 65,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ConsumerSignUp()));
                      },
                      child: Text(
                        "Sign up as a Consumer",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).accentColor),
                      ),
                      elevation: 3,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    height: 60,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        onPressed: () {},
                        elevation: 3,
                        color: Colors.white,
                        child: Text(
                          "Sign up as a Seller",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).accentColor),
                        )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
