import 'package:echange/menu/profile.dart';
import 'package:flutter/material.dart';

import 'filter_buttons.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

// TODO: filter data from onTap or current value of dropdowns
class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var categoryValue;
  var sizeValue;
  var colorValue;
  var stateValue;
  var distanceValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(242, 204, 143, 1),
        endDrawer: new Drawer(
          child: Profile(),
        ),
        appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset('assets/images/plant.png')),
          backgroundColor: Color.fromRGBO(129, 178, 154, 1.0),
        ),
        body: ListView(
          children: [
            ButtonBar(
              layoutBehavior: ButtonBarLayoutBehavior.constrained,
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButtons(
                  categoryName: "Talla",
                  items: ["S", "M", "L", "XL"],
                  selectedValue: sizeValue,
                  onChange: (String value) {
                    print("changed to $value");
                    setState(() {
                      sizeValue = value;
                    });
                  },
                ),
                FilterButtons(
                  categoryName: "Categoría",
                  items: ["Vestidos", "Bottoms", "Zapatos", "Accesorios"],
                  selectedValue: categoryValue,
                  onChange: (String value) {
                    print("changed to $value");
                    setState(() {
                      categoryValue = value;
                    });
                  },
                ),
                FilterButtons(
                  categoryName: "Estado",
                  items: [
                    "Nuevo",
                    "Usado",
                  ],
                  selectedValue: stateValue,
                  onChange: (String value) {
                    print("changed to $value");
                    setState(() {
                      stateValue = value;
                    });
                  },
                ),
                FilterButtons(
                  categoryName: "Distancia",
                  items: ["3km", "5km", "10km", "13km"],
                  selectedValue: distanceValue,
                  onChange: (String value) {
                    print("changed to $value");
                    setState(() {
                      distanceValue = value;
                    });
                  },
                )
              ],
            )
          ],
        ));
  }
}
