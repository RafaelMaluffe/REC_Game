import 'package:flutter/material.dart';
import 'package:rec_game_app/Widgets/JogoListTiles.dart';
import 'package:rec_game_app/Service/JogoService.dart' as serv;
//import 'package:rec_game_app/Widgets/PlataformaListTiles.dart';
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
                  Navigator.of(context).pushNamed('/JogoAdd');
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder<List<Jogo>>(
          future: serv.listarJogo,
          builder: (context, jog) {
            if (jog.hasError) print(jog.stackTrace);
            return jog.hasData
                ? JogoListTile(jog.data!)
                : Center(
                    child: Icon(Icons.access_time),
                  );
          },
        ));
  }
}
