import 'package:echange/utils/item_detail.dart';
import 'package:flutter/material.dart';

class FavoritesItem extends StatefulWidget {
  FavoritesItem({Key key}) : super(key: key);

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
                ownerName: "Sofia Lopez",
                ownerPicture: "assets/images/woman2.png",
                name: "Vestido oversized",
                description: "Color Verde",
                size: "G",
                state: "Nueva",
                image: "assets/clothes/vestido3.jpg")));
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
              Align(
                alignment: Alignment(-0.12, -1.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sofia Lopez",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Blusa Mediana",
                            style: Theme.of(context).textTheme.bodyText1),
                        Text(
                          "Color verde",
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ]),
                ),
              ),
              Align(
                  alignment: Alignment(-1.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(
                      "assets/clothes/vestido3.jpg",
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
