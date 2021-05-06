import 'package:echange/matches/matches_item.dart';
import 'package:echange/menu/menu.dart';
import 'package:flutter/material.dart';

class Matches extends StatefulWidget {
  Matches({Key key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(242, 204, 143, 1),
      endDrawer: new Drawer(
        child: Menu(),
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
                        "Tus Matches",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 25, color: Colors.black),
                      ),
                      Image.asset(
                        'assets/images/relationship.png',
                        width: 50,
                        height: 50,
                      )
                    ]),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.73,
              child: RefreshIndicator(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return MatchesItem();
                    }),
                onRefresh: () {},
              ))
        ],
      ),
    );
  }
}
