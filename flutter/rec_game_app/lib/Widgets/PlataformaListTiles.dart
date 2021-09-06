import 'package:flutter/material.dart';
import 'package:rec_game_app/models/plataforma.dart';
import 'package:rec_game_app/views/PlataformaAlt.dart';
import 'package:rec_game_app/Service/PlataformaService.dart' as serv;

int delID = 0;

class PlataformaTile extends StatelessWidget {
  final List<Plataforma> plat;

  const PlataformaTile(this.plat);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: plat.length,
        itemBuilder: (ctx, i) => ListTile(
            leading: plat[i].avatar == "" || plat[i].avatar.isEmpty
                ? CircleAvatar(
                    child: Icon(Icons.gamepad_rounded),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(plat[i].avatar),
                  ),
            title: Text(plat[i].descricao),
            subtitle: Text(plat[i].dataCadastro),
            trailing: Container(
              width: 100,
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PlataformaAlt(plat: plat[i])));
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        delID = plat[i].id;
                        showAlertDialog(context);
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            )));
  }

  // A função não tem acesso ao objeto plat.
  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Apagar"),
      onPressed: () {
        serv.daletarPlataforma(delID);
        return Navigator.pop(context);
      },
    ); // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text("Tem certeza que deseja apagar esse registro?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
