import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:intl/intl.dart';
import 'package:rec_game_app/Service/JogoService.dart';
import 'package:rec_game_app/Widgets/ComboPlataforma.dart';

// ignore: camel_case_types
class JogoAdd extends StatefulWidget {
  JogoAdd({Key? key}) : super(key: key);

  @override
  _JogoAddState createState() => new _JogoAddState();
}

class _JogoAddState extends State<JogoAdd> {
  final DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _form = GlobalKey<FormState>();
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();
  final List GeneroTags = ['Plataforma', 'FPS', 'RPG', 'Puzzle'];
  final List plats = ['PC', 'PSP', 'SNES'];
  List tags = [];

  @override
  Widget build(BuildContext context) {
    String descricao = '';
    String dataCadastro = DateFormat("dd/MM/yyyy").format(dateToday).toString();
    int plataforma = 0;
    List<int> genero = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Jogo'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final validOK = _form.currentState?.validate();

                if (validOK == true) {
                  _form.currentState!.save();
                  criarJogo(descricao, dataCadastro, plataforma, genero)
                      .then((value) => print(value));

                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
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
              /* TextFormField(
                autofillHints: ['PC', 'PSP', 'SNES'],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Escolha a plataforma"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tem que ter uma plataforma";
                  }
                },
                onSaved: (value) => descricao = value!,
              ), */
              SettingsWidget(),
              Tags(
                key: _globalKey,
                itemCount: tags.length,
                columns: 6,
                textField: TagsTextField(onSubmitted: (string) {
                  setState(() {
                    tags.add(Item(title: string));
                  });
                }),
                itemBuilder: (index) {
                  Item currentItem = tags[index];
                  return ItemTags(
                    index: index,
                    title: currentItem.title!,
                    customData: currentItem.customData,
                    combine: ItemTagsCombine.withTextBefore,
                    onPressed: (i) => print(i),
                    onLongPressed: (i) => print(i),
                    removeButton: ItemTagsRemoveButton(onRemoved: () {
                      setState(() {
                        tags.removeAt(index);
                      });
                      return true;
                    }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
