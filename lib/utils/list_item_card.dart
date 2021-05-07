import 'package:flutter/material.dart';

class ListItemCard extends StatefulWidget {
  final bool isOwn;
  final String name;
  final String description;
  final String size;
  final String state;
  final String image;
  ListItemCard(
      {Key key,
      this.isOwn,
      @required this.name,
      @required this.description,
      @required this.size,
      @required this.state,
      @required this.image})
      : super(key: key);

  @override
  _ListItemCardState createState() => _ListItemCardState();
}

class _ListItemCardState extends State<ListItemCard> {
  bool liked = false;
  var assetLikedButton = 'assets/images/heart_outlined.png';
  String likeSnackbarText;

  @override
  Widget build(BuildContext context) {
    var row = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Ink(
          decoration:
              const ShapeDecoration(shape: CircleBorder(), color: Colors.grey),
          child: IconButton(
            icon: Image.asset(
              'assets/images/close.png',
              height: 20,
            ),
            onPressed: () {
              // TODO: Remove from queuque to show item
              ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text("Esta prenda ya no se mostrará")));
            },
            highlightColor: Color.fromRGBO(224, 122, 95, 1),
          ),
        ),
        Ink(
          decoration:
              const ShapeDecoration(shape: CircleBorder(), color: Colors.grey),
          child: IconButton(
            icon: Image.asset(
              assetLikedButton,
              height: 30,
            ),
            onPressed: () {
              // TODO: Add to favorites
              liked = !liked;
              if (liked) {
                setState(() {
                  assetLikedButton = 'assets/images/heart.png';
                  likeSnackbarText = "Prenda añadida a tus favoritos!";
                });
              } else {
                setState(() {
                  assetLikedButton = 'assets/images/heart_outlined.png';
                  likeSnackbarText = "Prenda removida de tus favoritos!";
                });
              }
              ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(likeSnackbarText)));
            },
            highlightColor: Color.fromRGBO(129, 178, 154, 1),
          ),
        )
      ],
    );
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 20),
                ),
                Text(this.widget.description,
                    style: Theme.of(context).textTheme.bodyText1),
                Text("Talla: " + this.widget.size,
                    style: Theme.of(context).textTheme.bodyText1),
                Text("Estado: " + this.widget.state,
                    style: Theme.of(context).textTheme.bodyText1),
                InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(10.0),
                  clipBehavior: Clip.none,
                  maxScale: 2,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        this.widget.image,
                        fit: BoxFit.contain,
                        cacheHeight: 230,
                      ),
                    ),
                  ),
                ),
                this.widget.isOwn
                    ? row
                    : Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Ink(
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(), color: Colors.grey),
                              child: IconButton(
                                icon: Image.asset(
                                  assetLikedButton,
                                  height: 30,
                                ),
                                onPressed: () {
                                  // TODO: Add to favorites on firebase
                                  liked = !liked;
                                  if (liked) {
                                    setState(() {
                                      assetLikedButton =
                                          'assets/images/heart.png';
                                      likeSnackbarText =
                                          "Prenda añadida a tus favoritos!";
                                    });
                                  } else {
                                    setState(() {
                                      assetLikedButton =
                                          'assets/images/heart_outlined.png';
                                      likeSnackbarText =
                                          "Prenda removida de tus favoritos!";
                                    });
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      new SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text(likeSnackbarText)));
                                },
                                highlightColor:
                                    Color.fromRGBO(129, 178, 154, 1),
                              ),
                            )
                          ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
