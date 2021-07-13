import 'package:flutter/material.dart';
import 'package:rec_game_app/views/Plataforma_List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Plataforma_List(),
    );
  }
}
