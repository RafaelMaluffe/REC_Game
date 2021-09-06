import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rec_game_app/Service/PlataformaService.dart';

// ignore: camel_case_types
class PlataformaAdd extends StatelessWidget {
  final DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String descricao = '';
    String dataCadastro = DateFormat("dd/MM/yyyy").format(dateToday).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Nova Plataforma'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final validOK = _form.currentState?.validate();

                if (validOK == true) {
                  _form.currentState!.save();
                  criarPlataforma(descricao, dataCadastro)
                      .then((value) => print(value));

                  Navigator.pop(context);
                  //setState(() {});
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
              decoration: InputDecoration(labelText: "Nome da nova Plataforma"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "A Plataforma precisa de um nome";
                }
                if (value.trim().length < 3) {
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
