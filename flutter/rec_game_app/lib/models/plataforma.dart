class Plataforma {
  final int id;
  final String descricao;
  final String dataCadastro;
  final String avatar;

  const Plataforma({
    required this.id,
    required this.descricao,
    required this.dataCadastro,
    required this.avatar,
  });

  factory Plataforma.fromjson(Map<String, dynamic> json) {
    return Plataforma(
        id: json["idPlataforma"] as int,
        descricao: json["descricao"] as String,
        dataCadastro: json["dataCadastro"] as String,
        avatar: "");
  }
}
