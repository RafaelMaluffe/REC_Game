import 'package:flutter/material.dart';
import 'package:rec_game_app/Widgets/PlataformaListTiles.dart';
import 'package:rec_game_app/models/plataforma.dart';
import 'package:rec_game_app/Service/PlataformaService.dart' as serv;

//Quem sabe para recarregar a lista Precise ser Statefull
// ignore: camel_case_types
class Plataforma_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Plataformas'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/PlataformaAdd');
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder<List<Plataforma>>(
          future: serv.listarPlataforma,
          builder: (context, plat) {
            if (plat.hasError) print(plat.stackTrace);
            return plat.hasData
                ? PlataformaTile(plat.data!)
                : Center(
                    child: Icon(Icons.access_time),
                  );
          },
        ));
  }
}
