import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rec_game_app/Service/GeneroService.dart' as gen;
import 'package:rec_game_app/Service/JogoService.dart';
import 'package:rec_game_app/Service/PlataformaService.dart' as plat;
import 'package:rec_game_app/models/genero.dart';
import 'package:rec_game_app/models/plataforma.dart';

int? plataforma;
List<int> genero = [];
late var img64;

// ignore: camel_case_types
class JogoAdd extends StatefulWidget {
  JogoAdd({Key? key}) : super(key: key);

  @override
  _JogoAddState createState() => new _JogoAddState();
}

class _JogoAddState extends State<JogoAdd> {
  @override
  void initState() {
    super.initState();
  }

  final DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String descricao = '';
    String dataCadastro = DateFormat("yyyy-MM-dd").format(dateToday).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Jogo'),
      ),
      body: Container(
        width: 500,
        height: 600,
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Nome do Jogo"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O jogo tem que ter um Título";
                  }
                  if (value.trim().length <= 1) {
                    return "Nome muito curto";
                  }
                },
                onSaved: (value) => descricao = value!,
              ),
              FutureBuilder<List<Plataforma>>(
                  future: plat.listarPlataforma,
                  builder: (context, plataforma) {
                    return plataforma.hasData
                        ? Column(
                            children: [
                              DropDownBox(
                                  tipo: 'plataforma',
                                  listaDrop: plataforma.data!,
                                  text: 'Plataforma:'),
                            ],
                          )
                        : Center(
                            child: Icon(Icons.access_time),
                          );
                  }),
              FutureBuilder<List<Genero>>(
                  future: gen.listarGenero,
                  builder: (context, genero) {
                    return genero.hasData
                        ? Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: DropDownBox(
                                      tipo: 'genero',
                                      listaDrop: genero.data!,
                                      text: 'Gênero: '),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  child: DropDownBox(
                                      tipo: 'genero',
                                      listaDrop: genero.data!,
                                      text: 'Sub-Gênero:'),
                                ),
                              ],
                            ),
                          ])
                        : Center(
                            child: Icon(Icons.access_time),
                          );
                  }),
              ElevatedButton.icon(
                  onPressed: getFromGallery,
                  icon: Icon(Icons.add_a_photo),
                  label: Text("")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final validOk = _form.currentState?.validate();
          if (validOk == true) {
            _form.currentState!.save();
            //String base64Encode(List<int> imag64) => base64.encode(imag64);
            // final bytes = File(img64).readAsBytesSync();
            String imgfinal = base64Encode(img64);
            print(imgfinal);
            criarJogo(descricao, dataCadastro, plataforma!, genero, imgfinal);
          }
          Navigator.pop(context);
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }

  getFromGallery() async {
    XFile? PickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    setState(() {
      // ImageFile = File(PickedFile!.path);
      Future.delayed(Duration.zero, () async {
        img64 = await PickedFile!.readAsBytes();
      });
    });
  }
}

class DropDownBox extends StatefulWidget {
  final List<dynamic> listaDrop;
  final String text;
  final String tipo;

  DropDownBox(
      {Key? key,
      required this.listaDrop,
      required this.text,
      required this.tipo})
      : super(key: key);

  @override
  _DropDownBoxState createState() =>
      new _DropDownBoxState(listaDrop, text, tipo);
}

class _DropDownBoxState extends State<DropDownBox> {
  List<dynamic> _ListaDrop;
  String _Text;
  String _tipo;
  _DropDownBoxState(this._ListaDrop, this._Text, this._tipo);
  late List<DropdownMenuItem<dynamic>> _dropDownMenuItems;
  late dynamic _ItemAtual;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _ItemAtual = _dropDownMenuItems[0].value!;
    _tipo = _tipo.toLowerCase();
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
      if (_tipo == 'plataforma') {
        plataforma = _ItemAtual.id;
      } else if (_tipo == 'genero') {
        genero.add(_ItemAtual.id);
      }
      ;
    });
  }
}
