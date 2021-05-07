import 'package:echange/models/fav_item.dart';
import 'package:echange/utils/item_detail.dart';
import 'package:flutter/material.dart';

class FavoritesItem extends StatefulWidget {
  final FavItem favItem;
  FavoritesItem({Key key, @required this.favItem}) : super(key: key);

  @override
  _FavoritesItemState createState() => _FavoritesItemState();
}

class _FavoritesItemState extends State<FavoritesItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDetail(
                isOwn: false,
                ownerName: this.widget.favItem.ownerName,
                ownerPicture: this.widget.favItem.ownerPicture,
                name: this.widget.favItem.name,
                description: this.widget.favItem.description,
                size: this.widget.favItem.size,
                state: this.widget.favItem.status,
                image: this.widget.favItem.urlPicture)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(242, 204, 143, 1.0),
            border:
                Border.all(color: Color.fromRGBO(61, 64, 91, 1.0), width: 0.5)),
        child: Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 90),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.widget.favItem.ownerName,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 4,
                      ),
                      Text(this.widget.favItem.name,
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(
                        this.widget.favItem.description,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ]),
              ),
              Align(
                  alignment: Alignment(-1.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.network(
                      this.widget.favItem.urlPicture,
                      height: 85,
                      width: 85,
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
