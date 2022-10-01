import 'package:flutter/material.dart';
import 'package:flutter_vick_app/pages/home.dart';
import 'package:flutter_vick_app/pages/pagamento.dart';
import 'package:flutter_vick_app/pages/usuarios.dart';

import 'pages/excursao.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: PrimeiraRota(),
  ));
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Clientes'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota (tela)"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),
    );
  }
}
