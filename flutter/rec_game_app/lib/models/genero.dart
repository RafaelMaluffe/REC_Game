class Genero {
  final int id;
  final String descricao;
  final String dataCadastro;
  final String avatar;

  const Genero({
    required this.id,
    required this.descricao,
    required this.dataCadastro,
    required this.avatar,
  });

  factory Genero.fromjson(Map<String, dynamic> json) {
    return Genero(
        id: json["idGenero"] as int,
        descricao: json["descricao"] as String,
        dataCadastro: json["dataCadastro"] as String,
        avatar: "");
  }
}
