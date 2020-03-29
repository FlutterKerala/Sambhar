import 'package:flutter/material.dart';
import 'package:sambharapp/widgets/dashboard_app_bar.dart';
import 'package:sambharapp/widgets/inputs.dart';
import 'package:sambharapp/widgets/sub_txt_widgets.dart';

class EditIteams extends StatelessWidget {
  static const String routeName = './EditIteams';

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
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    textCard('Items name'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                inputStyles(context, 'Price'),
                SizedBox(
                  height: 20,
                ),
                inputStyles(context, 'Stock'),
                SizedBox(
                  height: 20,
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
                ),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {},
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container inputStyles(BuildContext context, hintText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: textFieldDecoration,
      child: TextField(
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color.fromRGBO(94, 191, 70, 1)),
          contentPadding: EdgeInsets.only(left: 5),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
