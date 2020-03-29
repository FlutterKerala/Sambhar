import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';

class ConsumerDashboard extends StatelessWidget {
  static const routeName = '/ConsumerDashboard';

  @override
  Widget build(BuildContext context) {
    final _firebaseProvider = Provider.of<FirebaseLogin>(context);
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    var headertextStyle = TextStyle(
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.w600,
        fontSize: 20);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DashBoardDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            buildSliverAppBar(_scaffoldKey, context, _firebaseProvider),
            new SliverList(
                delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(
                      "Products",
                      style: headertextStyle,
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      padding: const EdgeInsets.all(20.0),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 10.0,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                            height: 30,
                            width: 30,
                            color: Colors.transparent,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              elevation: 10,
                              child: IconButton(
                                  icon: Icon(Icons.local_pizza),
                                  onPressed: null),
                            )),
                        Container(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 10,
                          child: IconButton(
                              icon: Icon(Icons.local_pizza), onPressed: null),
                        )),
                        Container(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 10,
                          child: IconButton(
                              icon: Icon(Icons.local_pizza), onPressed: null),
                        )),
                        Container(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 10,
                          child: IconButton(
                              icon: Icon(Icons.local_pizza), onPressed: null),
                        )),
                        Container(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 10,
                          child: IconButton(
                              icon: Icon(Icons.local_pizza), onPressed: null),
                        )),
                        Container(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 10,
                          child: IconButton(
                              icon: Icon(Icons.local_pizza), onPressed: null),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Shops Nearby",
                      style: headertextStyle,
                    )
                  ],
                ),
              )
            ])),
          ],
        ),
      ),
    );
  }

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  SliverAppBar buildSliverAppBar(GlobalKey<ScaffoldState> _scaffoldKey,
      BuildContext context, FirebaseLogin _firebaseProvider) {
    return SliverAppBar(
      leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          }),
      expandedHeight: 150.0,
      floating: true,
      pinned: true,
      snap: true,
      elevation: 0,
      backgroundColor: Theme.of(context).accentColor,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.only(bottom: 50, left: 50, top: 50),
          title: Row(
            children: <Widget>[
              Text("${getGreeting()}, ${_firebaseProvider.userName}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.bluemaumau.org/sites/default/files/default_images/default.png",
                ),
              )
            ],
          ),
          background: Image.asset(
            "assets/images/app-bg-notext.png",
            fit: BoxFit.cover,
          )),
    );
  }
}

class DashBoardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firebaseProvider = Provider.of<FirebaseLogin>(context);
    return Drawer(
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
                        leading: Icon(Icons.settings), title: Text('Settings')),
                    ListTile(
                        onTap: () {
                          _firebaseProvider.signOut();
                        },
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Logout'))
                  ],
                ))))
      ],
    ));
  }
}
