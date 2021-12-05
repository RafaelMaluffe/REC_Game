class Jogo {
  final int id;
  final String descricao;
  final String dataCadastro;
  final int plataforma;
  final List<int> generos;
  final String avatar;

  const Jogo({
    required this.id,
    required this.descricao,
    required this.dataCadastro,
    required this.plataforma,
    required this.avatar,
    required this.generos
  });

  factory Jogo.fromjson(Map<String, dynamic> json) {
    return Jogo(
        id: json["idJogo"] as int,
        descricao: json["descricao"] as String,
        dataCadastro: json["dataCadastro"] as String,
        plataforma: json["plataforma"] as int,
        generos: List.from(json["genero"]),
        avatar: json["imagem"] ?? "data:image/png;base64,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");
  }
}
