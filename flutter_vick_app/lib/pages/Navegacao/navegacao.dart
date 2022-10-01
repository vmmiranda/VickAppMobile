import 'package:flutter/material.dart';

import 'nova_pagina.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    NewPageScreen(""),
    NewPageScreen("Reservas"),
    NewPageScreen("Relatórios"),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cadastros"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Reservas"),
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
