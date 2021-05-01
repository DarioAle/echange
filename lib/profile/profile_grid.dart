import 'package:echange/menu/menu.dart';
import 'package:echange/utils/grid_item_card.dart';
import 'package:flutter/material.dart';

class ProfileGrid extends StatefulWidget {
  ProfileGrid({Key key}) : super(key: key);

  @override
  _ProfileGridState createState() => _ProfileGridState();
}

class _ProfileGridState extends State<ProfileGrid> {
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
        body: Column(children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.20,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 100,
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(181, 72, 219, .6),
                            child: Image.asset("assets/images/woman.png"),
                            minRadius: 50,
                            maxRadius: 80,
                          ),
                        ),
                        Text(
                          "Margarita Perez",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ]),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Color.fromRGBO(61, 64, 91, 1),
                    ),
                    onPressed: () {
                      //TO-DO: Add new item
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 250,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return GridItemCard(
                        name: "Falda animal print",
                        description: "Falda midi asimetrica",
                        size: "CH",
                        state: "Nuevo",
                        image: 'assets/clothes/falda1.jpg');
                  }),
            ),
          )
        ]));
  }
}
