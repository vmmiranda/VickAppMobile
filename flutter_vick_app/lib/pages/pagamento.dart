import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/pagamentoModel.dart';
import '../service/api_service.dart';

class Pagamento extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http-Json-ListView',
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
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
    return Scaffold(
        appBar: new AppBar(
            title: new Text("Pagamentos"), backgroundColor: Colors.blue),
        body: listaPagamentos());
  }

  listaPagamentos() {
    return ListView.builder(
      itemCount: pagamento.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(pagamento[index].name),
          trailing: Text(pagamento[index].valor.toString()),
        );
      },
    );
  }
}
