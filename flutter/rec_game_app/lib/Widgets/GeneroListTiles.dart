import 'package:flutter/material.dart';
import 'package:rec_game_app/models/genero.dart';
import 'package:rec_game_app/views/GeneroAlt.dart';
import 'package:rec_game_app/Service/GeneroService.dart' as serv;

int delID = 0;

class GeneroListTile extends StatelessWidget {
  final List<Genero> gen;

  const GeneroListTile(this.gen);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: gen.length,
        itemBuilder: (ctx, i) => ListTile(
            leading: gen[i].avatar == "" || gen[i].avatar.isEmpty
                ? CircleAvatar(
                    child: Icon(Icons.gamepad_rounded),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(gen[i].avatar),
                  ),
            title: Text(gen[i].descricao),
            subtitle: Text(gen[i].dataCadastro),
            trailing: Container(
              width: 100,
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GeneroAlt(gen: gen[i])));
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        delID = gen[i].id;
                        showAlertDialog(context);
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            )));
  }

  void showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Apagar"),
      onPressed: () {
        serv.daletarGenero(delID);
        return Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text("Tem certeza que deseja apagar esse registro?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
