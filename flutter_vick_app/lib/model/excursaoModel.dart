import 'dart:convert';

List<ExcursaoModel> excursaoModelFromJson(String str) =>
    List<ExcursaoModel>.from(
        json.decode(str).map((x) => ExcursaoModel.fromJson(x)));

class ExcursaoModel {
  ExcursaoModel(
      {required this.idexcursao,
      required this.idevento,
      required this.idpessoa,
      required this.nomeEvento,
      required this.nome});

  int idexcursao;
  int idevento;
  int idpessoa;
  String nomeEvento;
  String nome;

  factory ExcursaoModel.fromJson(Map<String, dynamic> json) => ExcursaoModel(
        idexcursao: json["IDEXCURSAO"],
        idevento: json["IDEVENTO"],
        idpessoa: json["IDPESSOA"],
        nomeEvento: json["NOME_EVENTO"],
        nome: json["NOME"],
      );

  Map<String, dynamic> toJson() => {
        "idexcursao": idexcursao,
        "idevento": idevento,
        "idpessoa": idpessoa,
        "nome_evento": nomeEvento,
        "nome": nome,
      };
}
