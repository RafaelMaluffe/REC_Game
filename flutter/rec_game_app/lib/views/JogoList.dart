import 'package:flutter/material.dart';
import 'package:rec_game_app/Widgets/JogoListTiles.dart';
import 'package:rec_game_app/models/Jogo.dart';

// ignore: camel_case_types
class JogoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Jogos'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/PlataformaAdd');
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder<List<Jogo>>(builder: (context, jog) {
          if (jog.hasError) print(jog.stackTrace);
          if (jog.hasData) {
            return JogoListTile();
          } else {
            return Center(
              child: Icon(Icons.access_time),
            );
          }
        }));
  }
}
