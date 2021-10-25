import 'package:flutter/material.dart';

class DropDownBox extends StatefulWidget {
  final List ListaDrop;
  final String Text;

  DropDownBox({Key? key, required this.ListaDrop, required this.Text})
      : super(key: key);

  @override
  _DropDownBoxState createState() => new _DropDownBoxState(ListaDrop, Text);
}

class _DropDownBoxState extends State<DropDownBox> {
  List _ListaDrop;
  String _Text;
  _DropDownBoxState(this._ListaDrop, this._Text);
  late List<DropdownMenuItem<String>> _dropDownMenuItems;
  late String _ItemAtual;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _ItemAtual = _dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String item in _ListaDrop) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
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
          new Text(_Text),
          new DropdownButton(
            value: _ItemAtual,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          )
        ],
      )),
    );
  }

  void changedDropDownItem(String? itemSelecionado) {
    setState(() {
      _ItemAtual = itemSelecionado!;
    });
  }
}
