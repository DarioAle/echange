import 'package:flutter/material.dart';

import 'filter_buttons.dart';

// TODO: Add state change with bloc ?
class FilterBar extends StatefulWidget {
  String categoryValue;
  String sizeValue;
  String colorValue;
  String stateValue;
  String distanceValue;
  FilterBar(categoryValue, sizeValue, colorValue, stateValue, distanceValue,
      {Key key})
      : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonBar(
        layoutBehavior: ButtonBarLayoutBehavior.constrained,
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterButtons(
            categoryName: "Talla",
            items: ["S", "M", "L", "XL"],
            selectedValue: this.widget.sizeValue,
            onChange: (String value) {
              setState(() {
                this.widget.sizeValue = value;
              });
            },
          ),
          FilterButtons(
            categoryName: "Categoría",
            items: ["Vestidos", "Bottoms", "Zapatos", "Accesorios"],
            selectedValue: this.widget.categoryValue,
            onChange: (String value) {
              setState(() {
                this.widget.categoryValue = value;
              });
            },
          ),
          FilterButtons(
            categoryName: "Estado",
            items: [
              "Nuevo",
              "Usado",
            ],
            selectedValue: this.widget.stateValue,
            onChange: (String value) {
              setState(() {
                this.widget.stateValue = value;
              });
            },
          ),
          FilterButtons(
            categoryName: "Distancia",
            items: ["3km", "5km", "10km", "13km"],
            selectedValue: this.widget.distanceValue,
            onChange: (String value) {
              print("changed to $value");
              setState(() {
                this.widget.distanceValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
