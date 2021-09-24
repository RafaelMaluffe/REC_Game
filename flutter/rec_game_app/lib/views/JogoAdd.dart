import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rec_game_app/Service/JogoService.dart';

// ignore: camel_case_types
class JogoAdd extends StatelessWidget {
  final DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _form = GlobalKey<FormState>();

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
      body: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            Text("Nome:"),
            TextFormField(
              decoration: InputDecoration(labelText: "Nome do Jogo"),
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
            Text("Plataforma:"),
            TextFormField(
              decoration: InputDecoration(labelText: "Escolha a plataforma"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tem que ter uma plataforma";
                }
              },
              onSaved: (value) => descricao = value!,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.add_sharp))
          ],
        ),
      ),
    );
  }
}
