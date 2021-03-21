import 'package:echange/favorites/favorites_item.dart';
import 'package:flutter/material.dart';
import 'package:echange/menu/profile.dart';

class Favorites extends StatefulWidget {
  Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(242, 204, 143, 1),
      endDrawer: new Drawer(
        child: Profile(),
      ),
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/plant.png')),
        backgroundColor: Color.fromRGBO(129, 178, 154, 1.0),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Tus Favoritos",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 25, color: Colors.black),
                      ),
                      Image.asset(
                        'assets/images/love.png',
                        width: 50,
                        height: 50,
                      )
                    ]),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.73,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return FavoritesItem();
                  }))
        ],
      ),
    );
  }
}


