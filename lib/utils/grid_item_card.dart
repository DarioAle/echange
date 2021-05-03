import 'package:echange/utils/item_detail.dart';
import 'package:flutter/material.dart';

class GridItemCard extends StatefulWidget {
  final String name;
  final String description;
  final String size;
  final String state;
  final String image;
  GridItemCard(
      {Key key,
      @required this.name,
      @required this.description,
      @required this.size,
      @required this.state,
      @required this.image})
      : super(key: key);

  @override
  _GridItemCardState createState() => _GridItemCardState();
}

class _GridItemCardState extends State<GridItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDetail(
                name: this.widget.name,
                description: this.widget.description,
                size: this.widget.size,
                state: this.widget.state,
                image: this.widget.image)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  this.widget.image,
                  fit: BoxFit.contain,
                  cacheHeight: 130,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5),
              child: Text(
                this.widget.name,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5),
              child: Text(this.widget.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5),
              child: Text("Talla: " + this.widget.size,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5),
              child: Text("Estado: " + this.widget.state,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
