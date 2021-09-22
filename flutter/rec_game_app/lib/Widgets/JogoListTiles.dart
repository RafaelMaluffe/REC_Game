import 'package:flutter/material.dart';
import 'package:rec_game_app/models/Jogo.dart';

int delID = 0;

class JogoListTile extends StatelessWidget {
  final List<Jogo> jog;

  const JogoListTile(this.jog);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jog.length,
      itemBuilder: (ctx, i) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: Text(jog[i].descricao),
              subtitle: Text(
                'Secondary Text',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                jog[i].dataCadastro,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 1'),
                ),
                TextButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
        // serv.daletarGenero(delID);
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
