import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sambharapp/provider/firebase_consumer_login.dart';
import 'package:sambharapp/screens/consumer_cart/consumer_cart.dart';

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
                      childAspectRatio: .85,
                      padding: const EdgeInsets.all(20.0),
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: <Widget>[
                        catGrid(Color(0xff5EBF46), "assets/images/veggies.png",
                            "Vegetables", context),
                        catGrid(Color(0xffE0D03D), "assets/images/egg.png",
                            "Poultry", context),
                        catGrid(Color(0xffB1523D), "assets/images/grains.png",
                            "Grains & Pulses", context),
                        catGrid(Color(0xff8D4EBD), "assets/images/fruits.png",
                            "Fruits", context),
                        catGrid(Color(0xff46BFB0), "assets/images/dairy.png",
                            "Dairy", context),
                        catGrid(Color(0xff4693BF), "assets/images/bread.png",
                            "Breads", context),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Shops Nearby",
                      style: headertextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(15),
                              title: Text("Damu Chettans Kada"),
                              subtitle: Text("1 Kms Away"),
                              leading:
                                  Image.asset("assets/images/shopicon.png"),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(15),
                              title: Text("Big Market Stores"),
                              subtitle: Text("4.5 Kms Away"),
                              leading:
                                  Image.asset("assets/images/shopicon.png"),
                            ),
                          )
                        ],
                      ),
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

  Container catGrid(Color cardColor, String icon, String info, context) {
    return Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Card(
              color: cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 10,
              child: Center(
                  child: IconButton(
                      icon: Image.asset(
                        icon,
                        fit: BoxFit.contain,
                        height: 60,
                        width: 60,
                      ),
                      iconSize: 80,
                      onPressed: null)),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  info,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w800),
                ))
          ],
        ));
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
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ConsumerCart()));
            })
      ],
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
