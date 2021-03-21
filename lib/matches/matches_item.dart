import 'package:flutter/material.dart';

class MatchesItem extends StatefulWidget {
  MatchesItem({Key key}) : super(key: key);

  @override
  _MatchesItemState createState() => _MatchesItemState();
}

class _MatchesItemState extends State<MatchesItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 95,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(children: [
            Align(
              alignment: Alignment(-0.12, -1.0),
              child: Padding(
                padding: const EdgeInsets.only(top : 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Andrea Gomez",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text("Blusa Mediana"),
                      Text("Color verde")
                    ]),
              ),
            ),
            Align(
                alignment: Alignment(-1.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.asset(
                    "assets/images/plant.png",
                    height: 85,
                    width: 85,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
