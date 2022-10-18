import 'package:flutter/material.dart';
import 'package:flutter_vick_app/pages/Navegacao/lista_cadastro.dart';
import 'package:flutter_vick_app/pages/Navegacao/lista_relatorios.dart';
import 'package:flutter_vick_app/pages/Reservas/home.dart';

import 'nova_pagina.dart';

class Navegacao extends StatefulWidget {
  @override
  _Navegacao createState() => _Navegacao();
}

class _Navegacao extends State<Navegacao> {
  int _indiceAtual = 0;
  /*final List<Widget> _telas = [
    NewPageScreen(""),
    NewPageScreen("Cadastros"),
    NewPageScreen("Roteiros"),
    NewPageScreen("Relatórios")
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vick Viagens e Turismo"),
      ),
      body: _body(),
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

    switch (_indiceAtual) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ListaCadastros();
            },
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return HomeViagem();
            },
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ListaRelatorios();
            },
          ),
        );
        break;
      default:
        print("ERRO");
    }
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(3.0),
        child: Card(
            child: Container(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Column(
                        children: <Widget>[
                          Text('Bem vindos a Vick Viagens e Turismo'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Column(
                        children: <Widget>[
                          Text(''),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'imagens/vick_logo.jpg',
                            fit: BoxFit.cover,
                            height: 450.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
