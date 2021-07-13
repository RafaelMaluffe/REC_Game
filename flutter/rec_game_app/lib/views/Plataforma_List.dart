import 'package:flutter/material.dart';
import 'package:rec_game_app/Widgets/PlataformaList.dart';
import 'package:rec_game_app/models/plataforma.dart';
import 'package:rec_game_app/provider/Plataforma.dart' as serv;

// ignore: camel_case_types
class Plataforma_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Plataformas'),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder<List<Plataforma>>(
          future: serv.listarPlataforma,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? PlataformaTile(snapshot.data!)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
