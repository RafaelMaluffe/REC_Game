import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rec_game_app/Service/GeneroService.dart' as gen;
import 'package:rec_game_app/Widgets/DropDownBox.dart';
import 'package:rec_game_app/models/genero.dart';
import 'package:rec_game_app/models/genero.dart';

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
  final List GeneroTags = ['Plataforma', 'FPS', 'RPG', 'Puzzle'];
  final List plats = ['PC', 'PSP', 'SNES', 'PolyStatiton'];

  @override
  Widget build(BuildContext context) {
    String descricao = '';
    String dataCadastro = DateFormat("dd/MM/yyyy").format(dateToday).toString();
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
              DropDownBox(ListaDrop: plats, Text: 'Escolha uma plataforma'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    child: DropDownBox(
                        ListaDrop: GeneroTags, Text: 'Escolha um Gênero'),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    child: DropDownBox(
                        ListaDrop: GeneroTags, Text: 'Escolha um Sub-Gênero'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }
}

PopularLista() {
  List Generos = gen.listarGenero as List;
  List<dynamic> listaDescricao = [];

  for (var i = 0; i < Generos.length; i++) {
    listaDescricao.add(Generos[i][2].toString());
  }
  return listaDescricao;
}
