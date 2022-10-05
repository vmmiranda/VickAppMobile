import 'dart:convert';

List<ClienteModel> clienteModelFromJson(String str) => List<ClienteModel>.from(
    json.decode(str).map((x) => ClienteModel.fromJson(x)));

class ClienteModel {
  String nome = "";
  String cidade = "";
  String data_nascimento = "";

  ClienteModel(String nome, String cidade, String data_nascimento) {
    this.nome = nome;
    this.cidade = cidade;
    this.data_nascimento = data_nascimento;
  }
  ClienteModel.fromJson(Map json)
      : nome = json['NOME'],
        cidade = json['CIDADE'].toString(),
        data_nascimento = json['DATA_NASCIMENTO'];
}
