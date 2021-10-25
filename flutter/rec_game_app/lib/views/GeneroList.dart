import 'package:flutter/material.dart';
import 'package:rec_game_app/Widgets/GeneroListTiles.dart';
import 'package:rec_game_app/models/genero.dart';
import 'package:rec_game_app/Service/GeneroService.dart' as serv;

// ignore: camel_case_types
class GeneroList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Generos'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/generoAdd');
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder<List<Genero>>(
          future: serv.listarGenero,
          builder: (context, gen) {
            if (gen.hasError) print(gen.stackTrace);
            return gen.hasData
                ? GeneroListTile(gen.data!)
                : Center(
                    child: Icon(Icons.access_time),
                  );
          },
        ));
  }
}
