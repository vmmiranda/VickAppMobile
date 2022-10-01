import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/clienteModel.dart';
import 'package:flutter_vick_app/service/api_service.dart';
import 'package:intl/intl.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../model/excursaoModel.dart';

class HomePageBusca extends StatefulWidget {
  const HomePageBusca({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageBusca> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  late List<ExcursaoModel>? _allUsers = [];
  //  {"id": 10, "name": "Becky", "age": 32},

  void _getData() async {
    _allUsers = (await ApiService().getExcursao())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  // This list holds the data for the list view
  late List<ExcursaoModel>? _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    super.initState();
    _getData();
    _foundUsers = _allUsers;
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    late List<ExcursaoModel>? results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers!
          .where((user) =>
              user.nome.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
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
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers!.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers!.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers![index].idpessoa),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers![index].idpessoa.toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundUsers![index].nome),
                          subtitle: Text(
                              '${_foundUsers![index].nomeEvento.toString()} '),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
