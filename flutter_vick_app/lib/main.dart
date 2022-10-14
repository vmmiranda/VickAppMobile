import 'package:flutter/material.dart';
import 'package:flutter_vick_app/pages/Cadastros/makedeal.dart';
import 'package:flutter_vick_app/pages/Cadastros/pessoas.dart';
import 'package:flutter_vick_app/pages/Cadastros/reserva.dart';
import 'package:flutter_vick_app/pages/Contato/contato.dart';
import 'package:flutter_vick_app/pages/Gerais/viagem.dart';
import 'package:flutter_vick_app/pages/Navegacao/navegacaopadrao.dart';
import 'package:flutter_vick_app/pages/Relatorios/cliente.dart';
import 'package:flutter_vick_app/pages/Navegacao/navegacao.dart';
import 'package:flutter_vick_app/pages/Relatorios/cliente_busca.dart';
import 'package:flutter_vick_app/pages/Relatorios/excursao_busca.dart';
import 'package:flutter_vick_app/pages/Relatorios/homebusca.dart';
import 'package:flutter_vick_app/pages/Relatorios/pagamento.dart';
import 'package:flutter_vick_app/pages/Relatorios/usuarios.dart';
import 'package:flutter_vick_app/pages/Relatorios/usuarios_busca.dart';
import 'package:flutter_vick_app/pages/Reservas/detalhes.dart';
import 'package:flutter_vick_app/pages/Reservas/home.dart';
import 'package:flutter_vick_app/pages/Reservas/principal.dart';

import 'pages/Relatorios/excursao.dart';

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
              MaterialPageRoute(builder: (context) => MainScreenViagem()),
            );
            /*Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NavegacaoPadrao()),
            );*/
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
