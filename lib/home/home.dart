import 'package:echange/menu/menu.dart';
import 'package:echange/utils/custom_app_bar.dart';
import 'package:echange/utils/list_item_card.dart';
import 'package:flutter/material.dart';

import 'filter_bar.dart';
import '../utils/mock_clothes.dart' as mockData;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(242, 204, 143, 1),
        endDrawer: new Drawer(
          child: Menu(),
        ),
        appBar: customAppBar,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            FilterBar(categoryValue, sizeValue, colorValue, stateValue),
            RefreshIndicator(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: mockData.MOCK.length,
                itemBuilder: (context, index) {
                  return ListItemCard(
                    isOwn: true,
                    name: mockData.MOCK[index]["name"],
                    description: mockData.MOCK[index]["description"],
                    size: mockData.MOCK[index]["size"],
                    state: mockData.MOCK[index]["state"],
                    image: mockData.MOCK[index]["image"],
                  );
                },
              ),
              onRefresh: () {},
            )
          ],
        ));
  }
}
