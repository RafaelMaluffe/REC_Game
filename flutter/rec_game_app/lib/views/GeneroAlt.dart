import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rec_game_app/Service/GeneroService.dart';
import 'package:rec_game_app/models/genero.dart';

// ignore: camel_case_types
class GeneroAlt extends StatelessWidget {
  final Genero gen;

  const GeneroAlt({Key? key, required this.gen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    DateTime dateToday =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    String descricao = '';
    String dataCadastro = DateFormat("dd/MM/yyyy").format(dateToday).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar Genero'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final validOK = _form.currentState?.validate();

                if (validOK == true) {
                  _form.currentState!.save();
                  alterarGenero(gen.id, descricao, dataCadastro)
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
              initialValue: gen.descricao,
              validator: (value) {
                if (value!.isEmpty) {
                  return "O genero tem que ter um nome";
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
