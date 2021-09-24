import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rec_game_app/models/Jogo.dart';

class JogoService with ChangeNotifier {
  final Map<String, Jogo> _itens = {};

  List<Jogo> get all {
    return [..._itens.values];
  }
}

Future<List<Jogo>> get listarJogo async {
  final client = http.Client();
  final url = Uri.parse("http://localhost:8080/jogo");
  final resposta = await client.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
  });
  print(resposta.body);
  return compute(parseJogo, resposta.body);
}

Future<http.Response> criarJogo(String descricao, String dataCadastro) async {
  return await http.post(
    Uri.parse("http://localhost:8080/jogo"),
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

Future<http.Response> alterarJogo(
    int id, String descricao, String dataCadastro) async {
  return await http.put(
    Uri.parse("http://localhost:8080/jogo"),
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

Future<http.Response> daletarJogo(int id) async {
  return await http.delete(
    Uri.parse("http://localhost:8080/jogo"),
    headers: <String, String>{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, Object>{
      'id': id,
    }),
  );
}

List<Jogo> parseJogo(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Jogo>((json) => Jogo.fromjson(json)).toList();
}
