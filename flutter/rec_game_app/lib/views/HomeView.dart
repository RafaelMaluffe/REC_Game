import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Menu'),
        ),
        body: const Center(
          child: Text('Estatisticas e outras coisas'),
        ),
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
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Plataforma'),
              onTap: () {
                Navigator.of(context).pushNamed('/Plataforma');
              },
            ),
            ListTile(
              title: const Text('Gênero'),
              onTap: () {
                Navigator.of(context).pushNamed('/Genero');
              },
            ),
            ListTile(
              title: const Text('Jogo'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        )));
  }
}
