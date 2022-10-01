import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/clienteModel.dart';
import 'package:flutter_vick_app/service/api_service.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var clientes = [];
  _getCliente() {
    ApiService.getCliente().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        clientes = lista.map((model) => ClienteModel.fromJson(model)).toList();
      });
    });
  }

  _HomePageState() {
    _getCliente();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("Clientes"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: clientes == null ? 0 : clientes.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(clientes[index].nome),
              subtitle: Text(clientes[index].cidade),
              trailing: Text(DateFormat("dd/MM/yyyy")
                  .format(DateTime.parse(clientes[index].data_nascimento))),
            ),
          );
        },
      ),
    );
  }
}
