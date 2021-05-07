import 'package:echange/matches/matches_item.dart';
import 'package:echange/menu/menu.dart';
import 'package:echange/prospects/prospects_item.dart';
import 'package:flutter/material.dart';

class Prospects extends StatefulWidget {
  Prospects({Key key}) : super(key: key);

  @override
  _ProspectsState createState() => _ProspectsState();
}

class _ProspectsState extends State<Prospects> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                        "Prospectos",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 25, color: Colors.black),
                      ),
                      Image.asset(
                        'assets/images/Prospects.png',
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
                      return ProspectsItem();
                    }),
                onRefresh: () {},
              ))
        ],
      ),
    );
  }
}
