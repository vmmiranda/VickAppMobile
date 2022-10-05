import 'package:flutter/material.dart';

import 'nova_pagina.dart';

class Navegacao extends StatefulWidget {
  @override
  _Navegacao createState() => _Navegacao();
}

class _Navegacao extends State<Navegacao> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    NewPageScreen(""),
    NewPageScreen("Cadastros"),
    NewPageScreen("Roteiros"),
    NewPageScreen("Relatórios")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vick Viagens e Turismo"),
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cadastros"),
          BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore), label: "Roteiros"),
          BottomNavigationBarItem(
              icon: Icon(Icons.report), label: "Relatórios"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
