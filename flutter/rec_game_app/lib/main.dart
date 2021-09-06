import 'package:flutter/material.dart';
import 'package:rec_game_app/views/GeneroList.dart';
import 'package:rec_game_app/views/HomeView.dart';
import 'package:rec_game_app/views/PlataformaAdd.dart';
import 'package:rec_game_app/views/GeneroAdd.dart';
import 'package:rec_game_app/views/PlataformaList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REC Game',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/Plataforma': (context) => Plataforma_List(),
        '/PlataformaAdd': (context) => PlataformaAdd(),
        '/Genero': (context) => GeneroList(),
        '/GeneroAdd': (context) => GeneroAdd(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //home: Plataforma_List(),
    );
  }
}
