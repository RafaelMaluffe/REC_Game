import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rec_game_app/Service/GeneroService.dart';

// ignore: camel_case_types
class GeneroAdd extends StatelessWidget {
  final DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String descricao = '';
    String dataCadastro = DateFormat("dd/MM/yyyy").format(dateToday).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Genero'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final validOK = _form.currentState?.validate();

                if (validOK == true) {
                  _form.currentState!.save();
                  criarGenero(descricao, dataCadastro)
                      .then((value) => print(value));

                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            Text("Nome:"),
            TextFormField(
              decoration: InputDecoration(labelText: "Nome do Genero"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "O genero precisa de um nome";
                }
                if (value.trim().length < 2) {
                  return "Nome muito curto";
                }
              },
              onSaved: (value) => descricao = value!,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.skip_next))
          ],
        ),
      ),
    );
  }
}
