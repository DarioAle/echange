import 'package:echange/menu/menu.dart';
import 'package:echange/utils/list_item_card.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  final bool isOwn;
  final String ownerName;
  final String ownerPicture;
  final String name;
  final String description;
  final String size;
  final String state;
  final String image;
  ItemDetail(
      {Key key,
      this.isOwn,
      this.ownerName,
      this.ownerPicture,
      @required this.name,
      @required this.description,
      @required this.size,
      @required this.state,
      @required this.image})
      : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
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
                          child: this.widget.isOwn
                              ? Image.asset(this.widget.ownerPicture)
                              : Image.network(this.widget.ownerPicture),
                          minRadius: 50,
                          maxRadius: 80,
                        ),
                      ),
                      Text(
                        this.widget.ownerName,
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
                isOwn: this.widget.isOwn,
                name: this.widget.name,
                description: this.widget.description,
                size: this.widget.size,
                state: this.widget.state,
                image: this.widget.image),
          )
        ]));
  }
}
