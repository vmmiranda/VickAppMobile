import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data = [];

  Future<String> getData() async {
    var encodeFull = Uri.encodeFull(
        "http://webvickviagensturismoapi.azurewebsites.net/api/Clientes");
    var response = await http.get(Uri.parse(encodeFull), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    this.setState(() {
      data = json.decode(response.body);
    });

    //print(data);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("Clientes"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(data[index]["NOME"]),
              subtitle: Text(data[index]["CIDADE"]),
              trailing: Text(data[index]["DATA_NASCIMENTO"]),
            ),
          );
        },
      ),
    );
  }
}
