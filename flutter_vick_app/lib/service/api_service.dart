import 'dart:developer';

import 'package:flutter_vick_app/model/clienteModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_vick_app/constants/constants.dart';
import 'package:flutter_vick_app/model/excursaoModel.dart';
import 'package:flutter_vick_app/model/pagamentoModel.dart';

class ApiService {
  Future<List<ExcursaoModel>?> getExcursao() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.excursaoEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ExcursaoModel> _model = excursaoModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future getPagamento() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.pagamentoEndpoint);
    return await http.get(url);
  }

  static Future getCliente() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.clienteEndpoint);
    return await http.get(url);
  }

  Future<List<ClienteModel>?> getClienteBusca() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.clienteEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ClienteModel> _model = clienteModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
