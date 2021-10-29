import 'package:flutter/material.dart';
import 'package:rec_game_app/models/genero.dart';

class DropDownBox extends StatefulWidget {
  final List<dynamic> ListaDrop;
  final String Text;

  DropDownBox({Key? key, required this.ListaDrop, required this.Text})
      : super(key: key);

  @override
  _DropDownBoxState createState() => new _DropDownBoxState(ListaDrop, Text);
}

class _DropDownBoxState extends State<DropDownBox> {
  List<dynamic> _ListaDrop;
  String _Text;
  _DropDownBoxState(this._ListaDrop, this._Text);
  late List<DropdownMenuItem<dynamic>> _dropDownMenuItems;
  late dynamic _ItemAtual;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _ItemAtual = _dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<dynamic>> getDropDownMenuItems() {
    List<DropdownMenuItem> items = [];
    for (dynamic item in _ListaDrop) {
      items.add(
          new DropdownMenuItem(value: item, child: new Text(item.descricao)));
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

  void changedDropDownItem(dynamic itemSelecionado) {
    setState(() {
      _ItemAtual = itemSelecionado!;
    });
  }
}
