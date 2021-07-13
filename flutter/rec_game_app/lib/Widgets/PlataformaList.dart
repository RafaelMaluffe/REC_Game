import 'package:flutter/material.dart';
import 'package:rec_game_app/models/plataforma.dart';

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
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                ],
              ),
            )));
  }
}
