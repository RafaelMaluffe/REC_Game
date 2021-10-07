import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => new _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  List _cities = [
    "PSP",
    "SNES",
    "PC",
    "Dynavision",
    "Polystation",
    "PS1",
    "PS2",
    "PS3",
    "PS4",
    "Neo Geo",
    "NES",
    "Gameboy",
    "Gameboy Color",
    "Gameboy Advance",
    "Nintendo DS",
    "Nintendo 3DS",
    "Nintendo Wii",
    "Nintendo WiiU",
    "Nintendo Switch",
  ];

  late List<DropdownMenuItem<String>> _dropDownMenuItems;
  late String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Escolha uma plataforma"),
          new Container(
            padding: new EdgeInsets.all(16.0),
          ),
          new DropdownButton(
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          )
        ],
      )),
    );
  }

  void changedDropDownItem(String? selectedCity) {
    setState(() {
      _currentCity = selectedCity!;
    });
  }
}
