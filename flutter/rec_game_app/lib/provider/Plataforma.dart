import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rec_game_app/models/plataforma.dart';

class PlataformaService {
  final Map<String, Plataforma> _itens = {};

  List<Plataforma> get all {
    return [..._itens.values];
  }
}

Future<List<Plataforma>> get listarPlataforma async {
  //List<Plataforma> listPlat = [];
  final client = http.Client();
  final resposta =
      await client.get(Uri.parse("http://localhost:8080/plataforma"), headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": 'true',
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
  });
  print(resposta.body);
  return compute(parsePlataforma, resposta.body);
}

List<Plataforma> parsePlataforma(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Plataforma>((json) => Plataforma.fromjson(json)).toList();
}
