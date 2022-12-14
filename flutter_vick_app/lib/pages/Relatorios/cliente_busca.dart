import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/clienteModel.dart';
import 'package:flutter_vick_app/service/api_service.dart';
import 'package:intl/intl.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../model/excursaoModel.dart';

class ClienteBusca extends StatefulWidget {
  //const ExcursaoBusca({Key? key}) : super(key: key);

  @override
  _ClienteBusca createState() => _ClienteBusca();
}

class _ClienteBusca extends State<ClienteBusca> {
  late List<ClienteModel>? _allUsers = [];
  //  {"id": 10, "name": "Becky", "age": 32},

  late List<ClienteModel>? _foundUsers = [];

  void _getData() async {
    _allUsers = (await ApiService().getClienteBusca())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          _foundUsers = _allUsers;
        }));
  }

  @override
  initState() {
    super.initState();
    _getData();
    _foundUsers = _allUsers;
  }

  void _runFilter(String enteredKeyword) {
    late List<ClienteModel>? results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers!
          .where((user) =>
              user.nome.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca de Clientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Pesquisar', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers!.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers!.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(DateFormat("dd/MM/yyyy").format(
                            DateTime.parse(
                                _foundUsers![index].data_nascimento))),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            DateFormat("dd/MM/yyyy").format(DateTime.parse(
                                _foundUsers![index].data_nascimento)),
                            style: const TextStyle(fontSize: 14),
                          ),
                          title: Text(_foundUsers![index].nome),
                          subtitle:
                              Text('${_foundUsers![index].cidade.toString()} '),
                        ),
                      ),
                    )
                  : const Text(
                      'Nenhum resultado encontrado',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
