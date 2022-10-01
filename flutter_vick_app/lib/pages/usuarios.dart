import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/userModel.dart';
import 'package:flutter_vick_app/service/api.dart';

class Usuarios extends StatelessWidget {
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
  var users;
  _getUsers() {
    UsuariosAPI.getUsers().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => UserModel.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewState() {
    _getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Usuários"),
        ),
        body: listaUsuarios());
  }

  listaUsuarios() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text(users[index].name,
              style: TextStyle(fontSize: 20.0, color: Colors.black)),
          subtitle: Text(users[index].email),
        );
      },
    );
  }
}
