import 'package:echange/menu/menu.dart';
import 'package:echange/utils/list_item_card.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  final bool isOwn;
  final String name;
  final String description;
  final String size;
  final String state;
  final String distance;
  final String image;
  ItemDetail(
      {Key key,
      this.isOwn,
      @required this.name,
      @required this.description,
      @required this.size,
      @required this.state,
      @required this.distance,
      @required this.image})
      : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
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
                    ],
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            child: ListItemCard(
                name: this.widget.name,
                description: this.widget.description,
                size: this.widget.size,
                state: this.widget.state,
                distance: "5",
                image: this.widget.image),
          )
        ]));
  }
}
