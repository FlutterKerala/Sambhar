import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';

class ConsumerDashboard extends StatelessWidget {
  static const routeName = '/ConsumerDashboard';
  @override
  Widget build(BuildContext context) {
    final _firebaseProvider = Provider.of<FirebaseLogin>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Theme.of(context).accentColor,
        ),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(
                                "assets/images/app-bg-notext.png"))),
                    accountEmail: Text(_firebaseProvider.userPhone),
                    accountName: Text(_firebaseProvider.userName),
                  ),
                ],
              ),
            ),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings')),
                        ListTile(
                            onTap: () {
                              _firebaseProvider.signOut();
                            },
                            leading: Icon(Icons.exit_to_app),
                            title: Text('Logout'))
                      ],
                    ))))
          ],
        )),
        body: Center(child: Column()),
      ),
    );
  }
}
