import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rec_game_app/models/genero.dart';

class GeneroService with ChangeNotifier {
  final Map<String, Genero> _itens = {};

  List<Genero> get all {
    return [..._itens.values];
  }
}

Future<List<Genero>> get listarGenero async {
  final client = http.Client();
  final url = Uri.parse("http://localhost:8080/genero");
  final resposta = await client.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
  });
  return compute(parseGenero, resposta.body);
}

Future<http.Response> criarGenero(String descricao, String dataCadastro) async {
  return await http.post(
    Uri.parse("http://localhost:8080/genero"),
    headers: <String, String>{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'descricao': descricao,
      'dataCadastro': dataCadastro,
    }),
  );
}

Future<http.Response> alterarGenero(
    int id, String descricao, String dataCadastro) async {
  return await http.put(
    Uri.parse("http://localhost:8080/genero"),
    headers: <String, String>{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, Object>{
      'id': id,
      'descricao': descricao,
      'dataCadastro': dataCadastro,
    }),
  );
}

Future<http.Response> daletarGenero(int id) async {
  return await http.delete(
    Uri.parse("http://localhost:8080/genero"),
    headers: <String, String>{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, Object>{
      'id': id,
    }),
  );
}

List<Genero> parseGenero(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Genero>((json) => Genero.fromjson(json)).toList();
}
