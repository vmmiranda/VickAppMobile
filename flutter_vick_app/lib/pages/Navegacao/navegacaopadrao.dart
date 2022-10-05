import 'package:flutter/material.dart';

import 'nova_pagina.dart';

class NavegacaoPadrao extends StatefulWidget {
  @override
  _NavegacaoPadrao createState() => _NavegacaoPadrao();
}

class _NavegacaoPadrao extends State<NavegacaoPadrao> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    NewPageScreen(""),
    NewPageScreen("Reservas"),
    NewPageScreen("Viagens"),
    NewPageScreen("Contato")
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
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Reservas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel), label: "Viagens"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: "Contato"),
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
