import 'package:flutter/material.dart';
import 'package:rec_game_app/views/GeneroList.dart';
import 'package:rec_game_app/views/HomeView.dart';
import 'package:rec_game_app/views/JogoAdd.dart';
import 'package:rec_game_app/views/JogoList.dart';
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
        '/plataforma': (context) => Plataforma_List(),
        '/plataformaAdd': (context) => PlataformaAdd(),
        '/genero': (context) => GeneroList(),
        '/generoAdd': (context) => GeneroAdd(),
        '/jogo': (context) => JogoList(),
        '/jogoAdd': (context) => JogoAdd(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //home: Plataforma_List(),
    );
  }
}
