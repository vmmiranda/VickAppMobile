import 'dart:convert';

class PagamentoModel {
  String name = "";
  String valor = "";

  PagamentoModel(String name, String valor) {
    this.name = name;
    this.valor = valor;
  }
  PagamentoModel.fromJson(Map json)
      : name = json['NOME_PESSOA'],
        valor = json['VALOR'].toString();
}
