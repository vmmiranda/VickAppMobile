import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/pagamentoModel.dart';
import 'package:intl/intl.dart';
import '../../service/api_service.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({Key? key}) : super(key: key);

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<Pagamento> {
  var pagamento = [];
  _getPagamentos() {
    ApiService.getPagamento().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        pagamento =
            lista.map((model) => PagamentoModel.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewState() {
    _getPagamentos();
  }
  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("00.00");
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Pagamentos'),
      ),
      body: new ListView.builder(
        itemCount: pagamento == null ? 0 : pagamento.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(pagamento[index].name),
              trailing:
                  Text(formatter.format(double.parse(pagamento[index].valor))),
            ),
          );
        },
      ),
    );
  }
}
