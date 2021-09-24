class Jogo {
  final int id;
  final String descricao;
  final String dataCadastro;
  final int plataforma;
  final List<int> genero;
  final String avatar;

  const Jogo({
    required this.id,
    required this.descricao,
    required this.dataCadastro,
    required this.plataforma,
    required this.genero,
    required this.avatar,
  });

  factory Jogo.fromjson(Map<String, dynamic> json) {
    return Jogo(
        id: json["idJogo"] as int,
        descricao: json["descricao"] as String,
        dataCadastro: json["dataCadastro"] as String,
        plataforma: json["plataforma"] as int,
        genero: json["genero"] as List<int>,
        avatar: "");
  }
}
