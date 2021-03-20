import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String name;
  final String description;
  final String size;
  final String state;
  final String distance;
  final String image;
  ItemCard(
      {Key key,
      @required this.name,
      @required this.description,
      @required this.size,
      @required this.state,
      @required this.distance,
      @required this.image})
      : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 2,
        child: Container(
          alignment: Alignment.topLeft,
          height: 450,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  this.widget.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(this.widget.description),
                Text(this.widget.size),
                Text(this.widget.state),
                Text(this.widget.distance),
                InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(20.0),
                  clipBehavior: Clip.none,
                  maxScale: 2,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        this.widget.image,
                        fit: BoxFit.contain,
                        cacheHeight: 250,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
