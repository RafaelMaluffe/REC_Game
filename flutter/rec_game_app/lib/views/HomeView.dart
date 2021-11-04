import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Menu'),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(2),
                child: Container(
                  height: 100,
                  width: 230,
                  child: Card(
                      margin: EdgeInsets.all(2),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              radius: 60,
                              child: Image.network(
                                  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7d2bdf35-387b-43b3-bab6-9513da36b480/ddzn5t0-638a6512-7198-4ade-b6dd-4e52d3322e51.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdkMmJkZjM1LTM4N2ItNDNiMy1iYWI2LTk1MTNkYTM2YjQ4MFwvZGR6bjV0MC02MzhhNjUxMi03MTk4LTRhZGUtYjZkZC00ZTUyZDMzMjJlNTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3ykVzNbvfHBdtyNMpj7UXH1ZOP4IL9XTnj85DLrOA7A"),
                            ),
                            title: Text('Acesso FAST!'),
                            tileColor: Colors.white,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed('/jogoAdd'),
                                  child: const Text('Adicionar jogo'))
                            ],
                          ),
                        ],
                      )),
                ))),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Jogos'),
              onTap: () {
                Navigator.of(context).pushNamed('/jogo');
              },
            ),
            ListTile(
              title: const Text('Gênero'),
              onTap: () {
                Navigator.of(context).pushNamed('/genero');
              },
            ),
            ListTile(
              title: const Text('Plataforna'),
              onTap: () {
                Navigator.of(context).pushNamed('/plataforma');
              },
            )
          ],
        )));
  }
}
