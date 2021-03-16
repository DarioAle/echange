import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  String categoryName;
  List<String> items;
  String selectedValue;
  Function onChange;
  FilterButtons(
      {Key key,
      this.categoryName,
      this.items,
      this.selectedValue,
      this.onChange})
      : super(key: key);

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Color.fromRGBO(244, 241, 222, 1),
      hint: Text(this.widget.categoryName),
      value: this.widget.selectedValue,
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: this.widget.onChange,
      items: this.widget.items.map((String value) {
        return new DropdownMenuItem<String>(
            value: value, child: new Text(value));
      }).toList(),
    );
  }
}
